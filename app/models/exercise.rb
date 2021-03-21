class Exercise < ApplicationRecord
    has_many :program_exercises
    has_many :programs, through: :program_exercises
    has_many :custom_programs
    has_many :user_programs, through: :custom_programs
  
    enum exercise_type: {run: 0, strength: 1, recovery: 2, cross_train: 3, rest: 4}
end
