class RemoveUsernameFromUserProgram < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_programs, :username, :string
  end
end
