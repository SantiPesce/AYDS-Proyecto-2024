# controllers/questions_controller.rb
require 'sinatra/base'
require 'sinatra/activerecord'

class QuestionsController < Sinatra::Base
  enable :sessions

  # Display the question page
  get '/questions' do
    @user = User.find(session[:user_id])
    @current_lesson = Navigation.find_current_lesson(@user, @level)
    @slice_index = @current_lesson.slice_index
    @questions = Question.joins(:learning).where(learnings: { slice_index: @slice_index }).to_a  # Fetch questions by slice index
    @current_question = @questions[session[:current_question] || 0]  # Get the current question
    erb :'questions'
  end

  # Handle the form submission
  post '/questions' do
    @user = User.find(session[:user_id])
    @current_lesson = Navigation.find_current_lesson(@user, params[:level])
    @slice_index = @current_lesson.slice_index
    @questions = Question.joins(:learning).where(learnings: { slice_index: @slice_index }).to_a  # Fetch questions by slice index
    @current_question_index = session[:current_question] || 0
    @current_question = @questions[@current_question_index]  # Get the current question

    # Check the user's answer
    selected_option = params[:respuesta]
    correct_option = Option.find(selected_option).correct

    if correct_option
      session[:correct_answers_count] ||= 0
      session[:correct_answers_count] += 1
      @message = "¡Correcto! ¡Buena elección!"
    else
      @message = "¡Incorrecto! Deberías repasar algunos conceptos..."
    end

    # Move to the next question
    session[:current_question] = @current_question_index + 1

    erb :'questions'
  end
end