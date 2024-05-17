class CreateElementsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :elements do |k|
      k.string :symbol
      k.string :name
      k.integer :atomicMass
      k.integer :number
      k.string :group
      k.string :period
      k.string :clasification
    end
  end
end
