class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :names
      t.string :username
      t.string :email
      t.string :password
      t.integer :progress
      t.integer :actualLearning
      t.integer :actualLearningLevel2
      t.integer :lessonMaxProgress

      t.timestamps  # This will create created_at and updated_at columns
    end
  end
end
