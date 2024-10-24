class CreateLearningsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :learnings do |t|
      t.string :lesson
      t.string :levelImage
      t.integer :slice_index
    end    
  end
end
