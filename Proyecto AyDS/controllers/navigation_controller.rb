# controllers/navigation_controller.rb
require 'sinatra/base'
require 'sinatra/activerecord'

class NavigationController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)


  post '/learnpage' do
    @user = User.find(session[:user_id])
    @learnings = Learning.all
    @level = params[:level]
    @direction = params[:direction]
    @current_lesson = get_next_lesson(@user, @level, @direction)
    session[:level] = @level
    if !@current_lesson
      @current_lesson = Navigation.find_current_lesson(@user, @level)
      #elsif @current_lesson == :redirect_to_questions
      #session[:current_lesson] = @current_lesson
      #redirect '/questions'
    else
      Navigation.update_actualLearning(@user, @level, @current_lesson)
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

    if next_lesson && lesson_range.include?(next_lesson)
      current_lesson_slice = current_lesson.slice_index
      next_lesson_slice = next_lesson.slice_index
      if current_lesson_slice == next_lesson_slice
        next_lesson
      else
        redirect '/questions' if direction == "next"
      end
    elsif direction == "next"
      redirect '/questions'
    else
      current_lesson
    end
  end
end