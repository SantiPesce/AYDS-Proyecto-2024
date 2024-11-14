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
      if Navigation.lesson_in_level_range?(@level, @current_lesson)
        Navigation.update_actual_learning(@user, @level, @current_lesson)
      else
        # Manejar el caso donde la lección no está en el rango
        # Por ejemplo, redirigir a una página de error o establecer una lección predeterminada
      end
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

    # Si hay siguiente lección y está en el rango
    if next_lesson && lesson_range.include?(next_lesson)
      current_lesson_slice = current_lesson.slice_index
      next_lesson_slice = next_lesson.slice_index
      current_progress = Navigation.get_level_progress(user, level)

      if current_lesson_slice == next_lesson_slice
        next_lesson
      else # slice diferente
        if current_progress >= next_lesson_slice + 1
          next_lesson
        elsif current_progress < next_lesson_slice + 1
          redirect :'/questions'
        end
      end
      # Si no hay siguiente lección en el rango
    elsif direction == 'next'
      current_progress = Navigation.get_level_progress(user, level)
      case level
      when '1'
        redirect :'/questions' if current_progress < 5
      when '2'
        redirect :'/questions' if current_progress < 21
      end
    else
      current_lesson
    end
  end
end