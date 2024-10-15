# frozen_string_literal: true

# Estructura de los elementos
class Element < ActiveRecord::Base
  validates :Name, uniqueness: true
  validates :Number, uniqueness: true
end
