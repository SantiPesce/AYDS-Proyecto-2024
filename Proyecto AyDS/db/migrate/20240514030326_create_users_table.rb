class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :progress
      t.integer :progress2
      t.integer :actualLearning
      t.integer :actualLearningLevel2
      t.integer :correctAnswerCounter
      t.integer :incorrectAnswerCounter

      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
