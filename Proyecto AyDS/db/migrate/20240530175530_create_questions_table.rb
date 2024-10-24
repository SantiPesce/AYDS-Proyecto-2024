class CreateQuestionsTable < ActiveRecord::Migration[7.1]
  def change
    create_table "questions", force: :cascade do |t|
        t.integer "number"
        t.string "enunciation"
    end
  end
end
