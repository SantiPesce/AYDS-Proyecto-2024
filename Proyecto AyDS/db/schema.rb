# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_530_175_530) do
  create_table 'elements', force: :cascade do |t|
    t.string 'Symbol'
    t.string 'Name'
    t.float 'AtomicMass'
    t.integer 'Number'
    t.integer 'Group_'
    t.integer 'Period'
    t.string 'Classification'
  end

  create_table 'learnings', force: :cascade do |t|
    t.integer 'number'
    t.string 'lesson'
    t.integer 'level'
    t.string 'levelImage'
  end

  create_table 'options', force: :cascade do |t|
    t.integer 'level'
    t.integer 'questionNumber'
    t.boolean 'correct'
    t.string 'enunciation'
    t.integer 'question_id'
    t.index ['question_id'], name: 'index_options_on_question_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.integer 'number'
    t.integer 'level'
    t.string 'enunciation'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password'
    t.integer 'progress'
    t.integer 'progress2'
    t.integer 'actualLearning'
    t.integer 'actualLearningLevel2'
    t.integer 'correctAnswerCounter'
    t.integer 'incorrectAnswerCounter'
    t.datetime 'created_at', precision: nil
    t.datetime 'updated_at', precision: nil
  end
end
