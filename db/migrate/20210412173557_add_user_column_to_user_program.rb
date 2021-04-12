class AddUserColumnToUserProgram < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_programs, :user, null: false, foreign_key: true
  end
end
