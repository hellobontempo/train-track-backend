class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :title
      t.integer :length_in_weeks

      t.timestamps
    end
  end
end
