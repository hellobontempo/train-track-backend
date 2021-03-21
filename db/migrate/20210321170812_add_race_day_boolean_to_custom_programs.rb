class AddRaceDayBooleanToCustomPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :custom_programs, :is_race_day, :boolean
  end
end
