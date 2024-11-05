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

    if @current_question.nil?
      # Contabilizar resultado de las respuestas
      if session[:correct_answers_count] < 2
        @current_lesson = Learning.find_by(id: @current_lesson.id - 2)
        session[:current_lesson] = @current_lesson
        Navigation.update_actualLearning(@user, session[:level], @current_lesson)
      else
        @current_lesson = Learning.find_by(id: @current_lesson.id + 1)
        session[:current_lesson] = @current_lesson
        Navigation.update_actualLearning(@user, session[:level], @current_lesson)
      end
      # Redirigir a la página de aprendizaje después de actualizar actualLearning
      redirect '/learnpage'
    else
      erb :'questions'
    end
  end



  # controllers/questions_controller.rb
  post '/questions' do
    @user = User.find(session[:user_id])
    @slice_index = session[:slice_index]
    @questions = session[:questions].map { |id| Question.find(id) }
    @current_question_index = session[:current_question] || 0
    @current_question = @questions[@current_question_index]  # Get the current question

    #correct anserws count Initialization
    session[:correct_answers_count] ||= 0

    # Check the user's answer
    selected_option = params[:respuesta]
    correct_option = Option.find(selected_option).correct

    if correct_option
      session[:correct_answers_count] += 1
      message = "¡Correcto! ¡Buena elección!"
    else
      message = "¡Incorrecto! Deberías repasar algunos conceptos..."
    end

    # Move to the next question
    session[:current_question] = @current_question_index + 1

    if session[:current_question] >= @questions.size - 1
      content_type :json
      { correct: correct_option, message: message, finished: true }.to_json
    else
      content_type :json
      { correct: correct_option, message: message, finished: false }.to_json
    end
  end
end