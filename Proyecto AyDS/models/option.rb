# frozen_string_literal: true

# Estructura de las opciones
class Option < ActiveRecord::Base
  belongs_to :question
end
