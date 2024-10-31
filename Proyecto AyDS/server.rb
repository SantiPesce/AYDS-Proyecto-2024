require 'sinatra'
require 'sinatra/activerecord'
require 'rake'
require 'bcrypt'
require 'logger'

set :database_file, './config/database.yml'

enable :sessions

#MODELS REQUIRED:
require './models/user'
require './models/element'
require './models/learning'
require './models/question'
require './models/option'
require './models/navigation'

#CONTROLLERS REQUIRED:
require './controllers/questions_controller'

class App < Sinatra::Application


  def initialize(app = nil)
    super()
  end

  get '/' do
    erb :'welcome'
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
    erb :'login'
  end

  post '/login' do
    name = params[:usuario]
    password = params[:password]
    user = User.find_by(username: name) #busco por usuario y contrase;a

    if user && BCrypt::Password.new(user.password) == password # Si se encuentra el usuario y la contraseña coincide guardo su ID en la sesion
      session[:user_id] = user.id
      redirect '/menu' #redirijo al inicio
    else
      @error = "Contraseña o usuario incorrecto"
      erb :login # Sino tiro a una pagina fallida o login nuevamente
    end
  end

  get '/register' do
    @error = session.delete(:error)
    erb :'register'
  end

  post '/register' do
    # Obtengo valores
    names = params[:names]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    password = params[:password]  # Suponiendo que obtienes la contraseña desde los parámetros

    # Verificar si la contraseña cumple con los requisitos de seguridad
    if password.length < 12 ||
      password == password.upcase ||
      password == password.downcase ||
      password == 'Zendesk' ||
      password == email ||
      !password.match(/[0-9]/) ||
      !password.match(/[^a-zA-Z0-9]/)
      session[:error] = "La contraseña no cumple con los requisitos de seguridad"
      redirect '/register'
    end

    if User.exists?(email: email)
      session[:error] = "El email ya está registrado"
      redirect '/register' # Redirigir si el correo electrónico ya existe
    end

    if User.exists?(username: username)
      session[:error] = "El nombre de usuario ya está registrado"
      redirect '/register' # Redirigir si el nombre de usuario ya existe
    end

    # Encriptar la contraseña
    encrypted_password = BCrypt::Password.create(password)

    # Crear el nuevo usuario
    user = User.new(username: username, email: email, password: encrypted_password, progress: 1, progress2: 15, actualLearning: 1, actualLearningLevel2: 15)

    if user.save
      @success = "Te registraste correctamente, inicia sesión"
      erb :login
    else
      session[:error] = "Ocurrió un error al registrarte, inténtalo de nuevo"
      redirect '/register'
    end
  end

  get '/menu' do
    @user = User.find(session[:user_id])
    erb :'menu'
  end

  get '/menuGuest' do
    erb :'menuGuest'
  end

  get '/levelSelect' do
    @user = User.find(session[:user_id])
    erb :'levels'
  end



  #TODO terminar la logica de questions
  # para que cuando navigate lo precise
  # esta sea invocada.


  post '/learnpage' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    @level = params[:level]
    @direction = params[:direction]
    @current_lesson = Navigation.navigate(@user, @level, @direction)
    session[:level] = @level

    if !@current_lesson
       @current_lesson = Navigation.find_current_lesson(@user, @level)
    elsif @current_lesson == :redirect_to_questions
      redirect '/questions'
      else
        Navigation.update_actualLearning(@user, @level, @current_lesson)
        erb :'learnpage'
    end
  end



  get '/learnpage3' do
    @user = User.find(session[:user_id])
    erb  :'learnpage3'
  end

  get '/evaluacionl3' do
    @user = User.find(session[:user_id])
    @random_element = Element.order("RANDOM()").first
    random_attributes = [:Symbol, :AtomicMass, :Group_, :Period, :Classification]
    @random_attribute = random_attributes.sample.to_s  # Convertido a cadena explícitamente
    erb :'evaluacionl3'
  end



  get '/congratsLevel' do
    @user = User.find(session[:user_id])
    erb :'congratsLevel'
  end

  get '/table' do
    @elements = Element.all
    erb :'table'
  end

  get '/searchpage' do
    @searchbarfilter = params[:searchbarfilter]
    @searchbar = params[:searchbar]
    @results = []

    if @searchbarfilter == "Symbol"
      @results = Element.where("Symbol LIKE ?", "%#{@searchbar}%")
    elsif @searchbarfilter == "Name"
      @results = Element.where("Name LIKE ?", "%#{@searchbar}%")
    elsif @searchbarfilter == "AtomicMass"
      search_atomic_mass = @searchbar.to_f
      variacion = 0.3
      @results = Element.where("AtomicMass BETWEEN ? AND ?", search_atomic_mass - variacion, search_atomic_mass + variacion)
    elsif @searchbarfilter == "Number"
      search_number = @searchbar.to_i
      @results = Element.where("Number = ?", search_number)
    elsif @searchbarfilter == "Group"
      search_group = @searchbar.to_i
      @results = Element.where("Group_ = ?", search_group)
    elsif @searchbarfilter == "Period"
      search_period = @searchbar.to_i
      @results = Element.where("Period = ?", search_period)
    elsif @searchbarfilter == "Classification"
      @results = Element.where("Classification LIKE ?", "%#{@searchbar}%")
    end
    erb :'searchpage'
  end

  post '/searchpage' do
    erb :'searchpage'
  end

  get '/logout' do
    session.clear
    erb :welcome
  end
  #mount QuestionsController
  use QuestionsController
end

