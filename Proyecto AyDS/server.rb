require 'sinatra'
require 'sinatra/activerecord'
require 'rake'


set :database_file, './config/database.yml'

enable :sessions

require './models/user'

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

  get '/login' do
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
      redirect '/login' # Sino tiro a una pagina fallida o login nuevamente
    end
  end

  get '/register' do
    erb :'register'
  end

  post '/register' do

    # Obtengo valores
    names = params[:names]
    username = params[:username]
    email = params[:email]
    password = params[:password]
  
    if User.exists?(email: email)
      redirect '/register' # Redirigijo si el correo electrónico ya existe
    end

    if User.exists?(username: username)
      redirect '/register' # Redirijo si el nombre de usuario ya existe
    end
  
    # Creo el nuevo usuario
    user = User.new(names: names, username: username, email: email, password: password, progress: 0)
  
    if user.save
      redirect '/login' # redirecciono para que el usuario se logee
    else
      redirect '/inicio_fail' # trato el error de registro de alguna manera
    end
  end
  

  get '/menu' do
    @user = User.find(session[:user_id])
    erb :'menu'
  end
  

end
