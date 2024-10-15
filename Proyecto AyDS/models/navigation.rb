module Navigation
  SLICE_SIZE = 3

  def self.slice_index(lesson_id)
    lesson_id / SLICE_SIZE
  end

  def self.navigate(user, level, direction)
    current_lesson = find_current_lesson(user, level)
    return nil unless current_lesson

    #considerar lo que hay que devolver en lugar de retornar nil
    # cuando no hay leccionn para navegar

    lesson_range = lesson_range_by_level(level)
    next_lesson = if direction == "next" && current_lesson.id < lesson_range.last.id
                    lesson_range.where("id > ?", current_lesson.id).first
                    else if direction ==  "previous" && current_lesson.id > lesson_range.first.id
                         else
                           current_lesson # Si no hay dirección, se mantiene la lección actual
                         end
                  end
    update_learning_progress(user, level, next_lesson) if next_lesson && lesson_range.include?(next_lesson)
    next_lesson
  end

  def self.questions_for_lessons(lessons)
    lesson_ids = lessons.map(&:id)
    Question.where(lesson_id: lesson_ids)
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

  def self.update_learning_progress(user, level, next_lesson)
    field = "actualLearningLevel#{level}"
    user.update(field => next_lesson.id)
  end

  #TODO ESTA ES LA LOGICA QUE DEBERIA LLEVAR A QUESTIONS
  #if lesson
  #    current_slice = slice_index(current_lesson.id)
  #    new_slice = slice_index(lesson.id)

  #      if current_slice == new_slice
  #      user.update("actualLearningLevel#{level}" => lesson.id)
  #      lesson.id
  #    else
  #      nil
  #    end
  #  else
  #    nil
  #  end
  end