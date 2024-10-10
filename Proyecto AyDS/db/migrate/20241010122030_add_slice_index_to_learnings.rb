class AddSliceIndexToLearnings < ActiveRecord::Migration[5.0]
  def change
    add_column :learnings, :slice_index, :integer
  end
end
