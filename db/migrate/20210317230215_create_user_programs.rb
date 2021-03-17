class CreateUserPrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_programs do |t|
      t.date :start_date
      t.string :username
      t.integer :first_rest_day
      t.integer :second_rest_day
      t.references :program, null: false, foreign_key: true
    
      t.timestamps
    end
  end
end
