# frozen_string_literal: true

# migracion de la tabla preguntas
class CreateQuestionsTable < ActiveRecord::Migration[7.1]
  def change
    create_table 'questions', force: :cascade do |t|
      t.integer 'number'
      t.integer 'level'
      t.string 'enunciation'
    end
  end
end
