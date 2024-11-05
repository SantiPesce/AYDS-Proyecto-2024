# frozen_string_literal: true

# migracion de preguntas
class CreateQuestionsTable < ActiveRecord::Migration[7.1]
  def change
    create_table 'questions', force: :cascade do |t|
      t.integer 'number'
      t.string 'enunciation'
      t.integer 'slice_index'
    end
  end
end
