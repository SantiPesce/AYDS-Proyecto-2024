module Navigation

  def self.navigate(user, level, direction)
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
      update_actualLearning(user, level, next_lesson)
    else
      return nil
    end

    next_lesson
  end

  private

  def self.find_current_lesson(user, level)
    field = "actualLearningLevel#{level}"
    lesson_id = user.send(field)
    Learning.find_by(id: lesson_id)
  end

  def self.lesson_range_by_level(level)
    if level == "1"
      Learning.where("id >= 1 AND id <= 14")
    else
      Learning.where("id >= 15 AND id <= 19")
    end
  end

  def self.update_actualLearning(user, level, next_lesson)
    field = "actualLearningLevel#{level}"
    user.update(field => next_lesson.id)
  end

end