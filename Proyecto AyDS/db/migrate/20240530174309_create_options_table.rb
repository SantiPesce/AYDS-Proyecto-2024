class CreateOptionsTable < ActiveRecord::Migration[7.1]
  def change
     create_table "options", force: :cascade do |t|
        t.integer "level"
        t.integer "questionNumber"
        t.boolean "correct"
        t.string "enunciation"
        t.integer "question_id"
        t.index ["question_id"], name: "index_options_on_question_id"
    end
  end
end
