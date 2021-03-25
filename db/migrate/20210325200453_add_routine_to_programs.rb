class AddRoutineToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :programs, :routine, :string
  end
end
