# frozen_string_literal: true

# migracion de usuarios
class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |tbl|
      user_add_columns(tbl)
    end
  end

  private

  def user_add_columns(tbl)
    tbl.string :username
    tbl.string :email
    tbl.string :password
    tbl.integer :progress1
    tbl.integer :progress2
    tbl.integer :actualLearningLevel1
    tbl.integer :actualLearningLevel2
    tbl.integer :correctAnswerCounter
    tbl.integer :incorrectAnswerCounter
    tbl.datetime 'created_at'
    tbl.datetime 'updated_at'
  end
end
