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

ActiveRecord::Schema.define(version: 2021_03_16_223805) do

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.integer "exercise_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "program_exercises", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "miles"
    t.integer "program_id", null: false
    t.integer "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_program_exercises_on_exercise_id"
    t.index ["program_id"], name: "index_program_exercises_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title"
    t.integer "length_in_weeks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "program_exercises", "exercises"
  add_foreign_key "program_exercises", "programs"
end
