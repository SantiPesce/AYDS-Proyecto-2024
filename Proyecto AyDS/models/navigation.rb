module Navigation
  def self.next_lesson(user, level)
    current_lesson_id = level == 1 ? user.actualLearningLevel1 : user.actualLearningLevel2
    current_lesson = Learning.find_by(id: current_lesson_id)

    next_lesson = if level == 1
                    Learning.where("id > ? AND id <= 14", current_lesson.id).first
                  else
                    Learning.where("id > ? AND id <= 19", current_lesson.id).first
                  end

    if next_lesson
      user.update("actualLearningLevel#{level}" => next_lesson.id)
      next_lesson
    else
      nil # fin lecciones
    end
  end
end

