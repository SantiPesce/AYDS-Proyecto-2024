# frozen_string_literal: true

# Estructura de las preguntas
class Question < ActiveRecord::Base
  has_many :options
end
