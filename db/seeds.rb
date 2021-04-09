# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# enum exercise_type: {run: 0, strength: 1, recovery: 2, cross_train: 3, rest: 4}

short_run = Exercise.create(name: "Short Run", exercise_type: 0 )
tempo_run = Exercise.create(name: "Tempo Run", exercise_type: 0 )
long_run = Exercise.create(name: "Long Run", exercise_type: 0 )
run = Exercise.create(name: "Run", exercise_type: 0 )
yoga = Exercise.create(name: "Yoga", exercise_type: 3) 
cycling = Exercise.create(name: "Cycling", exercise_type: 3)
strength = Exercise.create(name: "Strength Training", exercise_type: 1 )
swimming = Exercise.create(name: "Swimming", exercise_type: 3)
rest = Exercise.create(name: "Rest", exercise_type: 4)
walk = Exercise.create(name: "Walk", exercise_type: 2)
gentle = Exercise.create(name: "Gentle Yoga", exercise_type: 2)


# cross_train =  Exercise.where(exercise_type: "cross_train").pluck(:id)
# sample_cross = Exercise.find(cross_train.sample)

Program.create(title: "Half Marathon Training", routine: "rest, run-first, strength, run-fast, cross_train, rest, run-long", race_mileage: 13.1, description: "Short Run: Nice, easy pace. If you're new to running it's okay to walk/run - Tempo Run: Maintain a competitive pace. Goal is to increase speed every week - Long Run: Aim to maintain a steady pace as your mileage increases closer to race day.")
Program.create(title: "Full Marathon Training", routine: "rest, run-first, strength, run-fast, cross_train, rest, run-long", race_mileage: 26.2, description: "Short Run: Nice, easy pace. If you're new to running it's okay to walk/run - Tempo Run: Maintain a competitive pace. Goal is to increase speed every week - Long Run: Aim to maintain a steady pace as your mileage increases closer to race day.")

# Program.create(title: "Half Marathon Training", length_in_weeks: 6, routine: "rest, run-first, strength, run-fast, cross_train, rest, run-long", race_mileage: 13.1)
# Program.create(title: "Full Marathon Training", length_in_weeks: 6, routine: "rest, run-first, strength, run-fast, cross_train, rest, run-long", race_mileage: 26.2)

# ProgramExercise.create([
    
#     {day: 1, exercise: rest, program: mara_training},
#     {day: 2, miles: 3, exercise: run, program: mara_training},
#     {day: 3, exercise: strength, program: mara_training},
#     {day: 4, miles: 4, exercise: run, program: mara_training},
#     {day: 5, exercise: cycling, program: mara_training},
#     {day: 6, exercise: rest, program: mara_training},
#     {day: 7, miles: 7, exercise: run, program: mara_training},

#     {day: 8, exercise: rest, program: mara_training},
#     {day: 9, miles: 4, exercise: run, program: mara_training},
#     {day: 10, exercise: strength, program: mara_training},
#     {day: 11, miles: 5, exercise: run, program: mara_training},
#     {day: 12, exercise: yoga, program: mara_training},
#     {day: 13, exercise: rest, program: mara_training},
#     {day: 14, miles: 8, exercise: run, program: mara_training},

#     {day: 15, exercise: rest, program: mara_training},
#     {day: 16, miles: 3, exercise: run, program: mara_training},
#     {day: 17, exercise: strength, program: mara_training},
#     {day: 18, miles: 6, exercise: run, program: mara_training},
#     {day: 19, exercise: swimming, program: mara_training},
#     {day: 20, exercise: rest, program: mara_training},
#     {day: 21, miles: 9, exercise: run, program: mara_training},
    
#     {day: 22, exercise: rest, program: mara_training},
#     {day: 23, miles: 4, exercise: run, program: mara_training},
#     {day: 24, exercise: strength, program: mara_training},
#     {day: 25, miles: 5, exercise: run, program: mara_training},
#     {day: 26, exercise: cycling, program: mara_training},
#     {day: 27, exercise: rest, program: mara_training},
#     {day: 28, miles: 10, exercise: run, program: mara_training},
    
#     {day: 29, exercise: rest, program: mara_training},
#     {day: 30, miles: 3, exercise: run, program: mara_training},
#     {day: 31, exercise: strength, program: mara_training},
#     {day: 32, miles: 4, exercise: run, program: mara_training},
#     {day: 33, exercise: yoga, program: mara_training},
#     {day: 34, exercise: rest, program: mara_training},
#     {day: 35, miles: 11, exercise: run, program: mara_training},
    
#     {day: 36, exercise: rest, program: mara_training},
#     {day: 37, miles: 3, exercise: run, program: mara_training},
#     {day: 38, exercise: strength, program: mara_training},
#     {day: 39, miles: 3, exercise: run, program: mara_training},
#     {day: 40, exercise: cycling, program: mara_training},
#     {day: 41, exercise: rest, program: mara_training}
# ])