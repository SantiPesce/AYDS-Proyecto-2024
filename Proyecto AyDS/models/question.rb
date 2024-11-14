# frozen_string_literal: true

# clase de preguntas
class Question < ActiveRecord::Base
  belongs_to :learning
  has_many :options
end
