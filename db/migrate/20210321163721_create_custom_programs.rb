class CreateCustomPrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_programs do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :user_program, null: false, foreign_key: true
      t.integer :day
      t.date :workout_date
      t.integer :miles
      t.integer :week

      t.timestamps
    end
  end
end
