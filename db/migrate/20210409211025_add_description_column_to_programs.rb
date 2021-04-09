class AddDescriptionColumnToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :programs, :description, :text
  end
end
