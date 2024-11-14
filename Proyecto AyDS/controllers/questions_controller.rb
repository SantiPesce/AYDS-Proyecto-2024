# frozen_string_literal: true

# controllers/questions_controller.rb
require 'sinatra/base'
require 'sinatra/activerecord'
# para controlar el flujo de la evaluacion en el aprendizaje
class QuestionsController < Sinatra::Base
  set :views, File.expand_path('../views', __dir__)
  enable :sessions

  # Display the question page
  get '/questions' do
    @user = User.find(session[:user_id])
    @level = session[:level]
    @current_lesson = Navigation.find_current_lesson(@user, @level)
    @slice_index = @current_lesson.slice_index
    @questions = Question.where(slice_index: @slice_index).to_a # Fetch questions by slice index
    session[:questions] = @questions.map(&:id) # Store question IDs in session
    @current_question = @questions[session[:current_question] || 0] # Get the current question

    if @current_question.nil?
      # Contabilizar resultado de las respuestas
      @current_lesson = # si aprobó 2 o más preguntas, avanzar a la siguiente lección
        if session[:correct_answers_count] >= 2
          Navigation.update_progress(@user, @level)
          progress = Navigation.get_level_progress(@user, @level)
          if (@current_lesson.id == Navigation.maxlessonslevel1 ||
              @current_lesson.id == Navigation.maxlessonslevel2) && [
                5, 21
              ].include?(progress)
            Navigation.update_progress(@user, @level)
            redirect :'/congratsLevel' # si ya terminó todas las lecciones, felicitar
          end
          Learning.find_by(id: @current_lesson.id + 1)
        else
          Learning.find_by(id: @current_lesson.id - 2)
        end
      session[:current_lesson] = @current_lesson
      Navigation.update_actual_learning(@user, session[:level], @current_lesson)
      session[:current_question] = 0
      session[:correct_answers_count] = 0
      redirect '/learnpage'
    else
      erb :questions
    end
  end

  post '/questions' do
    @user = User.find(session[:user_id])
    @slice_index = session[:slice_index]
    @questions = session[:questions].map { |id| Question.find(id) }
    @current_question_index = session[:current_question] || 0
    @current_question = @questions[@current_question_index] # Get the current question

    # Correct answers count initialization
    session[:correct_answers_count] ||= 0
    session[:incorrect_answers_count] ||= 0

    # Check the user's answer
    selected_option = params[:respuesta]
    correct_option = Option.find(selected_option).correct

    if correct_option
      session[:correct_answers_count] += 1
      @user.increment!(:correctAnswerCounter)
      message = '¡Correcto! ¡Buena elección!'
    else
      session[:incorrect_answers_count] += 1
      @user.increment!(:incorrectAnswerCounter)
      message = '¡Incorrecto! Deberías repasar algunos conceptos...'
    end

    # Move to the next question
    session[:current_question] = @current_question_index + 1

    content_type :json
    if session[:current_question] >= @questions.size
      { correct: correct_option, message: message, finished: true }.to_json
    else
      { correct: correct_option, message: message, finished: false }.to_json
    end
  end
end
