class Exercise < ApplicationRecord
    has_many :program_exercises
    has_many :programs, through: :program_exercises
    has_many :custom_programs
    has_many :user_programs, through: :custom_programs
    has_many :cross_train_exercise_preferences, foreign_key: :cross_train_exercise_id
    has_many :cross_train_programs, through: :cross_train_exercise_preferences
    # belongs_to :cross_train_preference, class_name: "UserProgram"
  
    enum exercise_type: {run: 0, strength: 1, recovery: 2, cross_train: 3, rest: 4}
end
