class CreateCrossTrainExercisePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :cross_train_exercise_preferences do |t|
      t.integer :cross_train_program_id
      t.integer :cross_train_exercise_id

      t.timestamps
    end
  end
end
