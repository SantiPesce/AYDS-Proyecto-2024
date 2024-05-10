# myapp.rb
require 'sinatra'


get '/login' do
  erb :login
end

post '/login' do
  usuario = params[:usuario]
  password = params[:password]

  if usuario == 'mati' && password == 'admin'
    redirect 'adminpage'
  end

  puts "Usuario: #{usuario}, Contraseña: #{password}"

  redirect '/menu'
end

get '/register' do
  erb:register
end

get '/adminpage' do
  "Hola admin"
end

get '/menu' do
  # Verifica si el usuario está autenticado
  if session[:username]
    erb :menu
  else
    # Si no está autenticado, redirige al inicio de sesión
    redirect '/login'
  end
end