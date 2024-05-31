require 'sinatra'
require 'sinatra/activerecord'
require 'rake'

set :database_file, './config/database.yml'

enable :sessions

require './models/user'
require './models/element'
require './models/learning'
require './models/question'
require './models/option'

class App < Sinatra::Application
  
  def initialize(app = nil)
    super()
  end

  enable :sessions

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
    user = User.find_by(username: name, password: password) #busco por usuario y contrase;a
  
    if user # Si se encuentra el usuario y la contraseña coincide guardo su ID en la sesion
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
  
    if User.exists?(email: email)
      session[:error] = "El email ya esta registrado"
      redirect '/register' # Redirigijo si el correo electrónico ya existe
    end

    if User.exists?(username: username)
      session[:error] = "El nombre de usuario ya esta registrado"
      redirect '/register' # Redirijo si el nombre de usuario ya existe
    end
  
    # Creo el nuevo usuario
    user = User.new(names: names, username: username, email: email, password: password, progress: 0, actualLearning: 1, actualLearningLevel2: 15)
  
    if user.save
      @success = "Te registraste correctamente, inicia sesion"
      erb :login # Sino tiro a una pagina fallida o login nuevamente
    else
      session[:error] = "Ocurrio un error al registrarte, intentalo de nuevo"
      redirect '/register' # trato el error de registro de alguna manera
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

  get '/learnpage' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    erb :'learnpage'
  end

  post '/learnpage' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    erb :'learnpage'
  end


  get '/learnpage2' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    erb :'learnpage2'
  end

  post '/learnpage2' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    erb :'learnpage2'
  end

  post '/actualizar_leccion2' do
    nueva_leccion2 = params[:nueva_leccion2]
    @user = User.find(session[:user_id])
    @user.update(actualLearningLevel2: nueva_leccion2)
    redirect '/learnpage2'
  end

post '/actualizar_leccion' do
  nueva_leccion = params[:nueva_leccion]
  user = User.find(session[:user_id])

  # Verifica si nueva_leccion es múltiplo de 3 o si es igual al máximo
  Learning.maximum(:number)
  if (nueva_leccion.to_i % 4 == 0) || (user.actualLearning == Learning.maximum(:number))
    redirect '/questions'
  else
    user.update(actualLearning: nueva_leccion)
    redirect '/learnpage'
  end
end

  get '/table' do
    @elements = Element.all
    erb:'table'
  end
  
  get '/questions' do 
    @user = User.find(session[:user_id])
    @questions = Question.all
    @options = Option.all
    
    # Inicializa el contador de respuestas correctas
    @correct_answers_count ||= 0
    @incorrect_answers_count ||=0
    erb :'questions'
  end
  
  post '/questions' do
    @user = User.find(session[:user_id])
    # Obtener el valor de 'respuesta_correcta' desde los parámetros del formulario
    respuesta_correcta = params[:respuesta_correcta] == "true"
    
    # Inicializa los contadores de respuestas correctas e incorrectas desde la sesión
    session[:correct_answers_count] ||= 0
    session[:incorrect_answers_count] ||= 0
  
    if respuesta_correcta
      # Incrementa el contador de respuestas correctas
      session[:correct_answers_count] += 1
      @user.update(actualLearning: @user.actualLearning + 1)
    else
      # Incrementa el contador de respuestas incorrectas
      session[:incorrect_answers_count] += 1
  
      if session[:incorrect_answers_count] >= 2
        @user.update(actualLearning: @user.actualLearning - 2)
        # Redirige a la página de lecciones si hay 2 respuestas incorrectas
        redirect '/learnpage'
        return
      end
    end
  
    # Redirige según las condiciones después de actualizar los contadores
    if session[:correct_answers_count] >= 3
      redirect '/learnpage'
    else
      redirect '/questions'
    end
  end
  
  get '/congratsLevel' do
    @user = User.find(session[:user_id])
    @user.update(progress: @user.progress + 5)
    erb:'congratsLevel'
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
      variacion = 0.03
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
  
end
