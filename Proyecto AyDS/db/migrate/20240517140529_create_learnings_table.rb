class CreateLearningsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :learnings do |t|
      t.integer :number
      t.string :lesson
      t.integer :level
      t.string :levelImage
    end    
  end
end
