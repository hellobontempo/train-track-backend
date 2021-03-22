class CustomProgram < ApplicationRecord
  belongs_to :exercise
  belongs_to :user_program

  scope :order_by_day, -> { order(:workout_date)}
end
