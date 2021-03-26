class CrossTrainExercisePreference < ApplicationRecord
  belongs_to :cross_train_program, class_name: "UserProgram", optional: true
  belongs_to :cross_train_exercise, class_name: "Exercise"
end
