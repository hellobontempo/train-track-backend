class CreateExercisesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises_tables do |t|
      t.string :name
      t.boolean :strength
      t.boolean :cardio
      t.boolean :recovery

      t.timestamps
    end
  end
end
