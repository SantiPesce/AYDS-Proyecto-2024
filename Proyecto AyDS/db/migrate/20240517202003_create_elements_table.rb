class CreateElementsTable < ActiveRecord::Migration[5.0]
    def change
      create_table :elements do |t|
        t.string :Symbol
        t.string :Name
        t.float :AtomicMass
        t.integer :Number
        t.integer :Group_
        t.integer :Period
        t.string :Classification
      end
    end
  end
