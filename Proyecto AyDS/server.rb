require 'sinatra'
require 'sinatra/activerecord'

set :database_file, './config/database.yml'

require './models/user'

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

  get '/login' do
    erb :'login'
  end

  get '/register' do
    erb :'register'
  end

end