class AddRaceDateToUserPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :user_programs, :race_date, :date
  end
end
