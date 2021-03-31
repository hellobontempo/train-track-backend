class AddRaceDistanceColumnToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :programs, :race_mileage, :decimal
  end
end
