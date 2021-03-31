class RemoveProgramLengthFromPrograms < ActiveRecord::Migration[6.1]
  def change
    remove_column :programs, :length_in_weeks
  end
end
