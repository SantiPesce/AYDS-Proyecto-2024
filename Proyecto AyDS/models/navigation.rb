module Navigation
  def self.slice_index(lesson_id)
    (lesson_id - 1) / 3
  end

  def self.next_lesson(user, level)
    find_lesson(user, level, :next)
  end

  def self.previous_lesson(user, level)
    find_lesson(user, level,  :previous)
  end

  def self.questions_for_lessons(lessons)
    lesson_ids = lessons.map(&:id)
    Question.where(lesson_id: lesson_ids)
  end

  #defino metodos internos para la busqueda de las lecciones por nivel:
  private

  def self.find_lesson(user, level, direction)
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
    lesson_range = if level == 1
                     Learning.where("id >= 1 AND id <= 14")
                   else
                     Learning.where("id >= 15 AND id <= 19")
                   end

    lesson = if direction == :next
               lesson_range.where("id > ?", current_lesson_id).first
             else
               lesson_range.where("id < ?", current_lesson_id).last
             end

    if lesson
      current_slice = slice_index(current_lesson.id)
      new_slice = slice_index(lesson.id)

      if current_slice == new_slice
        user.update("actualLearningLevel#{level}" => lesson.id)
        lesson
      else
        #manejar el cambio de slice (PREGUNTAS O NO DEPENDEN DEL PROGRESO)
        nil
      end
    else
      nil # No hay más lecciones en este nivel
    end
  end
end
