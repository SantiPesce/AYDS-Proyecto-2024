# frozen_string_literal: true

# clase de opciones
class Option < ActiveRecord::Base
  belongs_to :question
end
