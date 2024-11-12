# frozen_string_literal: true

# migracion de elementos
class CreateElementsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.string :Symbol
      t.string :Name, uniqueness: true
      t.float :AtomicMass
      t.integer :Number
      t.integer :Group_
      t.integer :Period
      t.string :Classification

      t.index :Name, uniqueness: true
      t.index :Number, uniqueness: true
    end
  end
end
