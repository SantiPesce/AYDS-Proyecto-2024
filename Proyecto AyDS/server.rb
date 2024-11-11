# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'rake'
require 'bcrypt'
require 'logger'

set :database_file, './config/database.yml'

enable :sessions

# MODELS REQUIRED:
require './models/user'
require './models/element'
require './models/learning'
require './models/question'
require './models/option'
require './models/navigation'

# CONTROLLERS REQUIRED:
require './controllers/questions_controller'
require './controllers/navigation_controller'

# servidor de tabla periodica
class App < Sinatra::Application
  # mount controllers
  use QuestionsController
  use NavigationController

  def initialize(_app = nil)
    super()
  end

  $level1aggregatedlearnings = 0
  $level2aggregatedlearnings = 0
  $level1maxlearnings = 15 + $level1aggregatedlearnings
  $level2maxlearnings = 20 + $level2aggregatedlearnings

  get '/' do
    erb :welcome
  end

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/elements' do
    @elements = Element.all
    erb :'elements/index'
  end

  get '/login' do
    @error = session.delete(:error)
    erb :login
  end

  post '/login' do
    name = params[:usuario]
    password = params[:password]
    user = User.find_by(username: name) # busco por usuario y contrase;a

    if user && BCrypt::Password.new(user.password) == password
      session[:user_id] = user.id
      redirect '/menu' # redirijo al inicio
    else
      @error = 'Contraseña o usuario incorrecto'
      erb :login # Sino tiro a una pagina fallida o login nuevamente
    end
  end

  get '/register' do
    @error = session.delete(:error)
    erb :register
  end

  post '/register' do
    # Obtengo valores
    params[:names]
    username = params[:username]
    email = params[:email]
    params[:password]
    password = params[:password] # Suponiendo que obtienes la
    # contraseña desde los parámetros

    # Verificar si la contraseña cumple con los requisitos de seguridad
    if password.length < 12 ||
       password == password.upcase ||
       password == password.downcase ||
       password == 'Zendesk' ||
       password == email ||
       !password.match(/[0-9]/) ||
       !password.match(/[^a-zA-Z0-9]/)
      session[:error] = 'La contraseña no cumple con los requisitos de seguridad'
      redirect '/register'
    end

    if User.exists?(email: email)
      session[:error] = 'El email ya está registrado'
      redirect '/register' # Redirigir si el correo electrónico ya existe
    end

    if User.exists?(username: username)
      session[:error] = 'El nombre de usuario ya está registrado'
      redirect '/register' # Redirigir si el nombre de usuario ya existe
    end

    # Encriptar la contraseña
    encrypted_password = BCrypt::Password.create(password)

    # Crear el nuevo usuario
    user = User.new(username: username, email: email, password: encrypted_password, progress: 1, progress2: 15,
                    actualLearningLevel1: 1, actualLearningLevel2: 16, correctAnswerCounter: 0,
                    incorrectAnswerCounter: 0)

    if user.save
      @success = 'Te registraste correctamente, inicia sesión'
      erb :login
    else
      session[:error] = 'Ocurrió un error al registrarte, inténtalo de nuevo'
      redirect '/register'
    end
  end

  get '/menu' do
    @user = User.find(session[:user_id])
    erb :menu
  end

  get '/menuGuest' do
    erb :menuGuest
  end

  get '/levelSelect' do
    @user = User.find(session[:user_id])
    erb :levels
  end

  get '/learnpage3' do
    @user = User.find(session[:user_id])
    erb :learnpage3
  end

  get '/evaluacionl3' do
    @user = User.find(session[:user_id])
    @random_element = Element.order('RANDOM()').first
    random_attributes = %i[Symbol AtomicMass Group_ Period Classification]
    @random_attribute = random_attributes.sample.to_s
    # Hash de traducciones definido aquí mismo
    attribute_translations = {
      'Symbol' => 'Símbolo',
      'Name' => 'Nombre',
      'AtomicMass' => 'Masa Atómica',
      'Number' => 'Número Atómico',
      'Group_' => 'Grupo',
      'Period' => 'Período',
      'Classification' => 'Clasificación'
    }
    # Usar la traducción
    @translated_attribute = attribute_translations[@random_attribute]

    erb :evaluacionl3
  end

  get '/congratsLevel' do
    @user = User.find(session[:user_id])
    erb :congratsLevel
  end

  get '/table' do
    @elements = Element.all
    erb :table
  end

  get '/searchpage' do
    @searchbarfilter = params[:searchbarfilter]
    @searchbar = params[:searchbar]
    @results = []
    case @searchbarfilter
    when 'Symbol'
      @results = Element.where('Symbol LIKE ?', "%#{@searchbar}%")
    when 'Name'
      @results = Element.where('Name LIKE ?', "%#{@searchbar}%")
    when 'AtomicMass'
      search_atomic_mass = @searchbar.to_f
      variacion = 0.3
      @results = Element.where(
        'AtomicMass BETWEEN ? AND ?',
        search_atomic_mass - variacion,
        search_atomic_mass + variacion
      )
    when 'Number'
      search_number = @searchbar.to_i
      @results = Element.where('Number = ?', search_number)
    when 'Group'
      search_group = @searchbar.to_i
      @results = Element.where('Group_ = ?', search_group)
    when 'Period'
      search_period = @searchbar.to_i
      @results = Element.where('Period = ?', search_period)
    when 'Classification'
      @results = Element.where('Classification LIKE ?', "%#{@searchbar}%")
    end
    erb :searchpage
  end

  post '/searchpage' do
    erb :searchpage
  end

  get '/logout' do
    session.clear
    erb :welcome
  end

  get '/adminpage' do
    @user = User.find(session[:user_id])
    name = @user.username
    if name == 'superadmin'
      erb :adminpage
    else
      session[:error] = 'No puedes acceder ya que no eres administrador'
      redirect '/login'
    end
  end

  post '/learning/create' do
    max_slice_index = Learning.maximum(:slice_index) || 0
    params[:learnings].each_value do |learning_data|
      # Guardar la imagen en `public/images`
      next unless learning_data[:level_image] && learning_data[:level_image][:tempfile]

      filename = learning_data[:level_image][:filename]
      filepath = File.join('public/images', filename)

      # Mover el archivo a la carpeta `public/images`
      File.open(filepath, 'wb') do |file|
        file.write(learning_data[:level_image][:tempfile].read)
      end

      # Crear la lección en la base de datos
      Learning.create(
        lesson: learning_data[:learning],
        levelImage: filename,
        slice_index: max_slice_index + 1
      )
    end

    redirect '/menu' # Ajusta la ruta de redirección según corresponda
  end

  get '/answerCounter' do
    @user = User.find(session[:user_id])
    erb :answerCounter
  end
  post '/answerCounter' do
    @user = User.find(session[:user_id])
    erb :answerCounter
  end
end
