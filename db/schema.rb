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

ActiveRecord::Schema.define(version: 2021_03_26_175151) do

  create_table "cross_train_exercise_preferences", force: :cascade do |t|
    t.integer "cross_train_program_id"
    t.integer "cross_train_exercise_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_programs", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "user_program_id", null: false
    t.integer "day"
    t.date "workout_date"
    t.integer "miles"
    t.integer "week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_race_day"
    t.index ["exercise_id"], name: "index_custom_programs_on_exercise_id"
    t.index ["user_program_id"], name: "index_custom_programs_on_user_program_id"
  end

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
    t.string "routine"
  end

  create_table "user_programs", force: :cascade do |t|
    t.date "start_date"
    t.string "username"
    t.integer "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "race_date"
    t.index ["program_id"], name: "index_user_programs_on_program_id"
  end

  add_foreign_key "custom_programs", "exercises"
  add_foreign_key "custom_programs", "user_programs"
  add_foreign_key "program_exercises", "exercises"
  add_foreign_key "program_exercises", "programs"
  add_foreign_key "user_programs", "programs"
end
