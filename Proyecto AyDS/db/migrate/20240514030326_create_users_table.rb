class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :names
      t.string :username
      t.string :email
      t.string :password
      t.integer :progress

      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end

class CreateElementsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |k|
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