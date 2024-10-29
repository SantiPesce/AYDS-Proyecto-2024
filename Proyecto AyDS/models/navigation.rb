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

    if next_lesson && lesson_range.include?(next_lesson) #si hay next_lesson y esta en el rango
      #current_lesson_slice = current_lesson.slice_index
      #next_lesson_slice = next_lesson.slice_index
      if current_lesson.slice_index == next_lesson.slice_index #si las lecciones estan en el mismo slice
        next_lesson
      else
        if direction == "next" && user.progress < next_lesson_slice #si estan en el mismo slice y el progreso es menor que el siguiente
        :redirect_to_questions #si no estan en el mismo slice
        end
      end
      #si se terminaron las lecciones, por rango o porque es la ultima del ultimo nivel
      # se redirige a questions, TODO: AGREGAR LA CONDICION DEL PROGRESO
    elsif direction == "next" #TODO: && user.progress == max_progress(igual a la cantidad de lecciones /3)
      :redirect_to_questions
    else
      current_lesson
    end
  end


  private

  def self.find_current_lesson(user, level)
    field = "actualLearningLevel#{level}"
    lesson_id = user.send(field)
    Learning.find_by(id: lesson_id)
  end

  #TODO: HAY QUE AGREGAR VARIABLES QUE INDIQUEN EL MAXIMO DE LECCIONES POR NIVEL
  def self.lesson_range_by_level(level)
    if level == "1"
      Learning.where("id >= 1 AND id <= 15")
    else
      Learning.where("id >= 16 AND id <= 19")
    end
  end

  def self.update_actualLearning(user, level, next_lesson)
    field = "actualLearningLevel#{level}"
    user.update(field => next_lesson.id)
  end
end