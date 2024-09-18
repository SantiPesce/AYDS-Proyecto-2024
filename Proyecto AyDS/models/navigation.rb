module Navigation
  def self.slice_index(lesson_id)
    (lesson_id - 1) / 3
  end

  def self.next_lesson(user, level)
    # Obtengo la lección actual
    current_lesson_id = case level
                          when 1
                            user.actualLearningLevel1
                          when 2
                            user.actualLearningLevel2
                          else
                            user.actualLearningLevel1
                        end

    current_lesson = Learning.find_by(id: current_lesson_id)

    # Obtención de la próxima lección en función del id actual ya sea exista o no (nil)
    next_lesson = if level == 1
                    Learning.where("id > ? AND id >= 1 AND id <= 14", current_lesson.id).first
                  else
                    Learning.where("id > ? AND id >= 15 AND id <= 19", current_lesson.id).first
                  end

    if next_lesson
      current_slice = slice_index(current_lesson.id)
      next_slice = slice_index(next_lesson.id)

      if current_slice == next_slice
        user.update("actualLearningLevel#{level}" => next_lesson.id)
        next_lesson
      else
        # invocaciob del metodo que llama a las preguntas
        nil
      end
    else
      nil # no quedan lecciones en el nivel actual
    end
  end

  def self.questions_for_lessons(lessons)
    lesson_ids = lessons.map(&:id)
    Question.where(lesson_id: lesson_ids)
  end
end