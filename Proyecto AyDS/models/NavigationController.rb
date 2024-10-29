class NavigationController < Sinatra::Base
  post '/navigate' do
    user = User.find(session[:user_id])
    level = params[:level]
    direction = params[:direction]

    next_lesson = navigate(user, level, direction)

    if next_lesson == :redirect_to_questions
      redirect '/questions'
    else
      # Handle the next lesson logic
    end
  end

  private

  def navigate(user, level, direction)
    current_lesson = find_current_lesson(user, level)
    return nil unless current_lesson

    lesson_range = lesson_range_by_level(level)
    next_lesson = case direction
                  when "next"
                    lesson_range.where("id > ?", current_lesson.id).first
                  when "previous"
                    lesson_range.where("id < ?", current_lesson.id).last
                  else
                    current_lesson
                  end

    if next_lesson && lesson_range.include?(next_lesson)
      if current_lesson.slice_index == next_lesson.slice_index
        next_lesson
      else
        if direction == "next" && user.progress < next_lesson.slice_index
          :redirect_to_questions
        end
      end
    elsif direction == "next"
      :redirect_to_questions
    else
      current_lesson
    end
  end

  def find_current_lesson(user, level)
    field = "actualLearningLevel#{level}"
    lesson_id = user.send(field)
    Learning.find_by(id: lesson_id)
  end

  def lesson_range_by_level(level)
    if level == "1"
      Learning.where("id >= 1 AND id <= 15")
    else
      Learning.where("id >= 16 AND id <= 19")
    end
  end

  def update_actualLearning(user, level, next_lesson)
    field = "actualLearningLevel#{level}"
    user.update(field => next_lesson.id)
  end
end