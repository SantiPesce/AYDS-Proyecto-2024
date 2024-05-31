class AddOptionsToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_reference :options, :question, foreign_key: true
  end
end
