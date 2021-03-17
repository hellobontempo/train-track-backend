class CreateProgramExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :program_exercises do |t|
      t.references :exercise, null: false, foreign_key: true
      t.integer :miles
      t.references :program, null: false, foreign_key: true
      t.integer :day

      t.timestamps
    end
  end
end
