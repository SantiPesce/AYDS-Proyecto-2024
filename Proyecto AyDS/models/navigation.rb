# frozen_string_literal: true

# modulo de navegacion
module Navigation
  def self.find_current_lesson(user, level)
    field = "actualLearningLevel#{level}"
    lesson_id = user.send(field)
    Learning.find_by(id: lesson_id)
  end

  # TODO: HAY QUE AGREGAR VARIABLES QUE INDIQUEN EL MAXIMO DE LECCIONES POR NIVEL
  def self.lesson_range_by_level(level)
    if level == '1'
      Learning.where('id >= 1 AND id <= ?', $level1maxlearnings)
    else
      starting_point = $level1maxlearnings + 1
      Learning.where('id >= ? AND id <= ?', starting_point, $level2maxlearnings)
    end
  end

  def self.update_actual_learning(user, level, _next_lesson)
    field = "actualLearningLevel#{level}"
    user.update(field => next_lessonnext_lesson.id)
  end
end
