class CreateElementsTable < ActiveRecord::Migration[5.0]
    def change
      create_table :elements do |t|
        t.string :Symbol
        t.string :Name
        t.integer :AtomicMass
        t.integer :Number
        t.string :Group
        t.string :Period
        t.string :Classification
      end
    end
  end
  