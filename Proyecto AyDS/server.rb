require 'sinatra'
require 'sinatra/activerecord'
require 'rake'
require 'bcrypt'

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


  ################# LECCIONES NIVEL 1 #############################

  post '/actualizar_leccion' do
    nueva_leccion = params[:nueva_leccion].to_i
    user = User.find(session[:user_id])

    #variables auxiliares para mejorar la sintaxis
    #cantidad de preguntas del nivel y preguntas restantes
    max_lvl1_qnumber = Question.where(level: 1).maximum(:number)
    remaining_questions = max_lvl1_qnumber - (nueva_leccion)

    #Chequeo de la pregunta que se debe hacer en el momento apropiado
    if (remaining_questions >=3)
      session[:current_question] = nueva_leccion-3
    elsif remaining_questions == 2
      session[:current_question] = max_lvl1_qnumber - remaining_questions
    elsif remaining_questions == 1
      session[:current_question] = max_lvl1_qnumber - remaining_questions
    elsif remaining_questions == 0
      session[:current_question] = max_lvl1_qnumber - (remaining_questions + 3)
    else
      session[:current_question] = max_lvl1_qnumber
    end

    # Verifica si pasaron 3 lecciones o si es la leccion actual es la ultima del nivel
    if (nueva_leccion > user.progress) && ((nueva_leccion % 3 == 1) || (nueva_leccion > max_lvl1_qnumber))
      redirect '/questions'
    else
      user.update(actualLearning: nueva_leccion)
      redirect '/learnpage'
    end
  end

  get '/questions' do
    @user = User.find(session[:user_id])
    @questions = Question.all
    @options = Option.all
    @current_question = session[:current_question]
    # Inicializo contador de respuestas correctas e incorrectas
    @correct_answers_count ||= 0
    @incorrect_answers_count ||=0
    erb :'questions'
  end

  post '/questions' do
    @user = User.find(session[:user_id])
    # Obtener el valor de 'respuesta_correcta' desde los parámetros del formulario
    respuesta_correcta = params[:respuesta_correcta] == "true"

    #control de pregunta actual(en base a la ultima leccion)
    session[:current_question]
    # Inicializa los contadores de respuestas correctas e incorrectas desde la sesión
    session[:correct_answers_count] ||= 0
    session[:incorrect_answers_count] ||= 0
    #numero de preguntas de nivel 1
    max_lvl1_qnumber = Question.where(level: 1).maximum(:number)

    if respuesta_correcta
      if session[:current_question] < max_lvl1_qnumber
      # Incrementa el contador de respuestas correctas
      session[:correct_answers_count] += 1
      session[:current_question] += 1
      else
        @user.update(actualLearning: @user.actualLearning + 1)
        @user.update(progress: @user.progress + 3)
        redirect '/congratsLevel'
        return
      end
    else
      # Incrementa el contador de respuestas incorrectas
      session[:incorrect_answers_count] += 1
      if session[:incorrect_answers_count] >= 2
        # Redirige a la página de lecciones si hay 2 respuestas incorrectas y reinicia los contadores
        session[:incorrect_answers_count] = 0
        session[:correct_answers_count] = 0
        redirect '/learnpage'
      return
      end
    end

    # Redirige según las condiciones después de reiniciar los contadores
    if session[:correct_answers_count] >= 3
      session[:incorrect_answers_count] = 0
      session[:correct_answers_count] = 0
      @user.update(progress: @user.progress + 3)
      @user.update(actualLearning: @user.actualLearning + 1)
      redirect '/learnpage'
    else
      redirect '/questions'
    end
  end

  ################# LECCIONES NIVEL 2 #############################

  post '/actualizar_leccion2' do
    nueva_leccion2 = params[:nueva_leccion2].to_i
    user = User.find(session[:user_id])

    #variables auxiliares para mejorar la sintaxis
    #cantidad de preguntas del nivel y preguntas restantes
    max_lvl2_qnumber = Question.where(level: 2).maximum(:number)
    remaining_questions2 = max_lvl2_qnumber - (nueva_leccion2)

    #Chequeo de la pregunta que se debe hacer en el momento apropiado
    if (remaining_questions2 >2)
      session[:current_question2] = nueva_leccion2 - 3
    elsif remaining_questions2 == 2
      session[:current_question2] = max_lvl2_qnumber - (remaining_questions2+3)
    elsif remaining_questions2 == 1
      session[:current_question2] = max_lvl2_qnumber - (remaining_questions2+2)
    elsif remaining_questions2 == 0
      session[:current_question2] = max_lvl2_qnumber - (remaining_questions2+1)
    else
      session[:current_question2] = max_lvl2_qnumber - 2
    end

    # Verifica si pasaron 3 lecciones o si es la leccion actual es la ultima del nivel
    if (nueva_leccion2 > user.progress2) && ((nueva_leccion2 % 3 == 2) || (nueva_leccion2 > 19 ))
      redirect '/questions2'
    else
      user.update(actualLearningLevel2: nueva_leccion2)
      redirect '/learnpage2'
    end
  end


  get '/questions2' do
    @user = User.find(session[:user_id])
    @questions = Question.all
    @options = Option.all
    @current_question2 = session[:current_question2]
    # Inicializo contador de respuestas correctas e incorrectas
    @correct_answers_count ||= 0
    @incorrect_answers_count ||=0
    erb :'questions2'
  end


  post '/questions2' do
    @user = User.find(session[:user_id])
    # Obtener el valor de 'respuesta_correcta2' desde los parámetros del formulario
    respuesta_correcta2 = params[:respuesta_correcta2] == "true"

    #control de pregunta actual(en base a la ultima leccion)
    session[:current_question2]
    # Inicializa los contadores de respuestas correctas e incorrectas desde la sesión
    session[:correct_answers2_count] ||= 0
    session[:incorrect_answers2_count] ||= 0
    #numero de preguntas de nivel 1
    max_lvl2_qnumber = Question.where(level: 2).maximum(:number)

    if respuesta_correcta2
      if session[:current_question2] < max_lvl2_qnumber
      # Incrementa el contador de respuestas correctas
      session[:correct_answers2_count] += 1
      session[:current_question2] += 1
      else
        @user.update(actualLearningLevel2: max_lvl2_qnumber)
        @user.update(progress2: @user.progress2 + 3)
        redirect '/congratsLevel'
        return
      end
    else
      # Incrementa el contador de respuestas incorrectas
      session[:incorrect_answers2_count] += 1
      if session[:incorrect_answers2_count] >= 2
        # Redirige a la página de lecciones si hay 2 respuestas incorrectas
        redirect '/learnpage2'
      return
      end
    end

    # En caso de responder las 3 preguntas correctamente se actualizan los valores
    if session[:correct_answers2_count] >= 3
      session[:correct_answers2_count] = 0
      @user.update(progress2: @user.progress2 + 3)
      @user.update(actualLearningLevel2: @user.actualLearningLevel2 + 1)
      redirect '/learnpage2'
    else
      redirect '/questions2'
    end
  end



  get '/congratsLevel' do
    @user = User.find(session[:user_id])
    erb :'congratsLevel'
  end


  post '/actualizar_valor' do
    nueva_leccion = params[:nueva_leccion]
    user = User.find(session[:user_id])
    user.update(actualLearning: nueva_leccion)
    redirect'/menu'
  end


  post '/actualizar_valor2' do
    nueva_leccion2 = params[:nueva_leccion2]
    user = User.find(session[:user_id])
    user.update(actualLearningLevel2: nueva_leccion2)
    redirect'/menu'
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

end
