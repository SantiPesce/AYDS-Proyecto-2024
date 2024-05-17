class CreateElementsTable < ActiveRecord::Migration[5.0]
    def change
      create_table :elements do |t|
        t.string :symbol
        t.string :name
        t.integer :atomicMass
        t.integer :number
        t.string :group
        t.string :period
        t.string :clasification
      end
    end
  end
  