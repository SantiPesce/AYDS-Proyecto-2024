module Navigation
  def self.slice_index(lesson_number)
    (lesson_number - 1) / 3
  end

  def self.navigate(user, level, direction)
    case direction
    when "next"
      next_lesson(user, level)
    when "previous"
      previous_lesson(user, level)
    else
      nil
    end
  end

  def self.next_lesson(user, level)
    find_lesson(user, level, :next)
  end

  def self.previous_lesson(user, level)
    find_lesson(user, level, :previous)
  end

  def self.questions_for_lessons(lessons)
    lesson_numbers = lessons.map(&:number)
    Question.where(lesson_number: lesson_numbers)
  end

  private

  def self.find_lesson(user, level, direction)
    current_lesson_number = case level
                            when "1"
                              user.actualLearningLevel1
                            when "2"
                              user.actualLearningLevel2
                            when "3"
                              user.actualLearningLevel3
                            else
                              nil
                            end

    current_lesson = Learning.find_by(number: current_lesson_number)
    lesson_range = if level == "1"
                     Learning.where("number >= 1 AND number <= 14")
                   else
                     Learning.where("number >= 15 AND number <= 19")
                   end

    lesson = if direction == "next"
               lesson_range.where("number > ?", current_lesson_number).first
             elsif direction == "previous"
               lesson_range.where("number < ?", current_lesson_number).last
             else
               current_lesson
             end

    if lesson
      current_slice = slice_index(current_lesson.number)
      new_slice = slice_index(lesson.number)

      if current_slice == new_slice
        user.update("actualLearningLevel#{level}" => lesson.number)
        lesson.number
      else
        nil
      end
    else
      nil
    end
  end
end