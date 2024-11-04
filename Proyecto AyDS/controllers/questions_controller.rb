# controllers/questions_controller.rb
require 'sinatra/base'
require 'sinatra/activerecord'

class QuestionsController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  enable :sessions

  # Display the question page
  get '/questions' do
    @user = User.find(session[:user_id])
    @level = session[:level]
    @current_lesson = Navigation.find_current_lesson(@user, @level)
    @slice_index = @current_lesson.slice_index
    session[@slice_index] = @slice_index
    @questions = Question.where(slice_index: @slice_index).to_a # Fetch questions by slice index
    session[:questions] = @questions.map(&:id) # Store question IDs in session
    @current_question = @questions[session[:current_question] || 0]  # Get the current question
    erb :'questions'
  end

  #TODO: EN EL METODO POST QUESTIONS, SE DEBE LLEVAR LA CUENTA DE LAS PREGUNTAS CORRECTAS
  # EN LAS VARIABLES DE INSTANCIA DE LA MANERA NECESARIA DE PODER LLEVAR LA CUENTA
  # Y NAVEGAR SOBRE ELLAS DE MANERA CORRECTA

  post '/questions' do
    @user = User.find(session[:user_id])
    @slice_index = session[:slice_index]
    @questions = session[:questions].map { |id| Question.find(id) }
    @current_question_index = session[:current_question] || 0
    @current_question = @questions[@current_question_index]  # Get the current question

    # Check the user's answer
    selected_option = params[:respuesta]
    correct_option = Option.find(selected_option).correct

    if correct_option
      session[:correct_answers_count] ||= 0
      session[:correct_answers_count] += 1
      message = "¡Correcto! ¡Buena elección!"
    else
      message = "¡Incorrecto! Deberías repasar algunos conceptos..."
    end

    # Move to the next question
    session[:current_question] = @current_question_index + 1

    content_type :json
    { correct: correct_option, message: message }.to_json
  end
end