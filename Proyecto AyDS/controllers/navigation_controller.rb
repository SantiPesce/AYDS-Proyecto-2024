# frozen_string_literal: true

# controllers/navigation_controller.rb
require 'sinatra/base'
require 'sinatra/activerecord'
# para controlar la navegacion de el aprendizaje
class NavigationController < Sinatra::Base
  set :views, File.expand_path('../views', __dir__)
  enable :sessions

  get '/learnpage' do
    @user = User.find(session[:user_id])
    @current_lesson = session[:current_lesson]
    @direction = params[:direction]
    @level = session[:level]
    @current_lesson = get_next_lesson(@user, @level, @direction)

    erb :learnpage
  end

  post '/learnpage' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    @level = params[:level]
    @direction = params[:direction]
    @current_lesson = get_next_lesson(@user, @level, @direction)
    session[:level] = @level

    if @current_lesson
      Navigation.update_actual_learning(@user, @level, @current_lesson)
      session[:level] = @level
      session[:current_lesson] = @current_lesson
    else
      # si no hay leccion cargada, o me pase de rango(cargo la ultima valida)
      @current_lesson = Navigation.find_current_lesson(@user, @level)
    end
    erb :learnpage
  end

  private

  def get_next_lesson(user, level, direction)
    current_lesson = Navigation.find_current_lesson(user, level)
    return nil unless current_lesson

    lesson_range = Navigation.lesson_range_by_level(level)
    next_lesson = case direction
                  when 'next'
                    lesson_range.where('id > ?', current_lesson.id).first
                  when 'previous'
                    lesson_range.where('id < ?', current_lesson.id).last
                  else
                    current_lesson
                  end

    if next_lesson && lesson_range.include?(next_lesson) # si hay siguiente leccion y pertenece al nivel
      current_lesson_slice = current_lesson.slice_index
      next_lesson_slice = next_lesson.slice_index
      if current_lesson_slice == next_lesson_slice
        next_lesson
      else
        redirect :'/questions'
      end
    elsif direction == 'next'
      redirect :'/questions'
    else
      current_lesson
    end
  end
end
