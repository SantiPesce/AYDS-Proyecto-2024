# controllers/navigation_controller.rb
require 'sinatra/base'
require 'sinatra/activerecord'

class NavigationController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  enable :sessions

  get '/learnpage' do
    @user = User.find(session[:user_id])
    @current_lesson ||= session[:current_lesson]
    @level = session[:level]

    erb :'learnpage'
  end

  post '/learnpage' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    @level = params[:level]
    @direction = params[:direction]
    @current_lesson = get_next_lesson(@user, @level, @direction)

    if @current_lesson == :redirect_to_questions
      redirect '/questions'
    elsif @current_lesson
      Navigation.update_actualLearning(@user, @level, @current_lesson)
      session[:level] = @level
      session[:current_lesson] = @current_lesson
      erb :'learnpage'
    else
      # si no hay leccion cargada, o me pase de rango(cargo la ultima valida)
      @current_lesson = Navigation.find_current_lesson(@user, @level)
      erb :'learnpage'
    end
  end

  private

  def get_next_lesson(user, level, direction)
    current_lesson = Navigation.find_current_lesson(user, level)
    return nil unless current_lesson

    lesson_range = Navigation.lesson_range_by_level(level)
    next_lesson = case direction
                  when "next"
                    lesson_range.where("id > ?", current_lesson.id).first
                  when "previous"
                    lesson_range.where("id < ?", current_lesson.id).last
                  else
                    current_lesson
                  end

    if next_lesson && lesson_range.include?(next_lesson) #si hay siguiente leccion y pertenece al nivel
      current_lesson_slice = current_lesson.slice_index
      next_lesson_slice = next_lesson.slice_index
      if current_lesson_slice == next_lesson_slice
        next_lesson
      else
        :redirect_to_questions
      end
    elsif direction == "next"
      :redirect_to_questions
    else
      current_lesson
    end
  end
end
