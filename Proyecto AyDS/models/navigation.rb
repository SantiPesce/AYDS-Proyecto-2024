module Navigation

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