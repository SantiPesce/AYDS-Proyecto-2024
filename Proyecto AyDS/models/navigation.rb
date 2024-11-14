# frozen_string_literal: true

# modulo de navegacion
module Navigation
  MAX_LESSONS_LEVEL_1 = 15
  MAX_LESSONS_LEVEL_2 = 21

  # Getters
  def self.maxlessonslevel1
    MAX_LESSONS_LEVEL_1
  end

  def self.maxlessonslevel2
    MAX_LESSONS_LEVEL_2
  end

  def self.find_current_lesson(user, level)
    field = "actualLearningLevel#{level}"
    lesson_id = user.send(field)
    Learning.find_by(id: lesson_id)
  end

  # TODO: HAY QUE AGREGAR VARIABLES QUE INDIQUEN EL MAXIMO DE LECCIONES POR NIVEL
  def self.lesson_range_by_level(level)
    if level == '1'
      Learning.where('id >= 1 AND id <= ?', maxlessonslevel1)
    else
      Learning.where('id >= 16 AND id <= ?', maxlessonslevel2)
    end
  end

  def self.update_actual_learning(user, level, next_lesson)
    return unless lesson_in_level_range?(level, next_lesson)

    field = "actualLearningLevel#{level}"
    user.update(field => next_lesson.id)
  end

  def self.lesson_in_level_range?(level, lesson)
    lesson_range_by_level(level).exists?(id: lesson.id)
  end

  def self.update_progress(user, level)
    field = "progress#{level}"
    progress = user.send(field)
    user.update(field => progress + 1)
  end

  def self.get_level_progress(user, level)
    field = "progress#{level}"
    user.send(field)
  end
end
