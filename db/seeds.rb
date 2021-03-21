# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# enum exercise_type: {run: 0, strength: 1, recovery: 2, cross_train: 3, rest: 4}


run = Exercise.create(name: "run", exercise_type: 0 )
yoga = Exercise.create(name: "yoga", exercise_type: 3) 
cycling = Exercise.create(name: "cycling", exercise_type: 3)
strength = Exercise.create(name: "strength training", exercise_type: 1 )
swimming = Exercise.create(name: "swimming", exercise_type: 3)
rest = Exercise.create(name: "rest", exercise_type: 4)


# cross_train =  Exercise.where(exercise_type: "cross_train").pluck(:id)
# sample_cross = Exercise.find(cross_train.sample)

mara_training = Program.create(title: "Half Marathon Training", length_in_weeks: 6)


ProgramExercise.create([
    
    {day: 1, exercise: rest, program: mara_training},
    {day: 2, miles: 3, exercise: run, program: mara_training},
    {day: 3, exercise: strength, program: mara_training},
    {day: 4, miles: 4, exercise: run, program: mara_training},
    {day: 5, exercise: cycling, program: mara_training},
    {day: 6, exercise: rest, program: mara_training},
    {day: 7, miles: 7, exercise: run, program: mara_training},

    {day: 8, exercise: rest, program: mara_training},
    {day: 9, miles: 4, exercise: run, program: mara_training},
    {day: 10, exercise: strength, program: mara_training},
    {day: 11, miles: 5, exercise: run, program: mara_training},
    {day: 12, exercise: yoga, program: mara_training},
    {day: 13, exercise: rest, program: mara_training},
    {day: 14, miles: 8, exercise: run, program: mara_training},

    {day: 15, exercise: rest, program: mara_training},
    {day: 16, miles: 3, exercise: run, program: mara_training},
    {day: 17, exercise: strength, program: mara_training},
    {day: 18, miles: 6, exercise: run, program: mara_training},
    {day: 19, exercise: swimming, program: mara_training},
    {day: 20, exercise: rest, program: mara_training},
    {day: 21, miles: 9, exercise: run, program: mara_training},
    
    {day: 22, exercise: rest, program: mara_training},
    {day: 23, miles: 4, exercise: run, program: mara_training},
    {day: 24, exercise: strength, program: mara_training},
    {day: 25, miles: 5, exercise: run, program: mara_training},
    {day: 26, exercise: cycling, program: mara_training},
    {day: 27, exercise: rest, program: mara_training},
    {day: 28, miles: 10, exercise: run, program: mara_training},
    
    {day: 29, exercise: rest, program: mara_training},
    {day: 30, miles: 3, exercise: run, program: mara_training},
    {day: 31, exercise: strength, program: mara_training},
    {day: 32, miles: 4, exercise: run, program: mara_training},
    {day: 33, exercise: yoga, program: mara_training},
    {day: 34, exercise: rest, program: mara_training},
    {day: 35, miles: 11, exercise: run, program: mara_training},
    
    {day: 36, exercise: rest, program: mara_training},
    {day: 37, miles: 3, exercise: run, program: mara_training},
    {day: 38, exercise: strength, program: mara_training},
    {day: 39, miles: 3, exercise: run, program: mara_training},
    {day: 40, exercise: cycling, program: mara_training},
    {day: 41, exercise: rest, program: mara_training}
])