class AddProgramLengthToUserPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :user_programs, :length_in_weeks, :integer
  end
end
