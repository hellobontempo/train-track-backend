# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# enum exercise_type: {run: 0, strength: 1, recovery: 2, cross_train: 3, rest: 4}

Exercise.create([
    {name: "run", exercise_type: 0 }, 
    {name: "yoga", exercise_type: 2}, 
    {name: "cycling", exercise_type: 3}, 
    {name: "strength training", exercise_type: 1 },
    {name: "swimming", exercise_type: 3},
    {name: "rest", exercise_type: 4}
])

run = Exercise.find_by_name(name:"run")
yoga = Exercise.find_by_name(name:"yoga")
cross_train =  Exercise.where(exercise_type: "cross_train").pluck(:id)
strength = Exercise.find_by_name(name:"strength training")
rest = Exercise.find_by_name(name:"rest")

mara_training = Program.create(title: "Half Marathon Training", length_in_weeks: 6)


ProgramExercise.create([
    #week 1
    {(day: 1, miles: null, exercise: rest, program: mara_training)},
    {(day: 2, miles: 3, exercise: run, program: mara_training)},
    {(day: 3, miles: null, exercise: strength, program: mara_training)},
    {(day: 4, miles: 4, exercise: run, program: mara_training)},
    {(day: 5, miles: null, exercise: Exercise.find(cross_train.sample), program: mara_training)},
    {(day: 6, miles: null, exercise: rest, program: mara_training)},
    {(day: 7, miles: 7, exercise: run, program: mara_training)},
    #week 2
    {(day: 8, miles: null, exercise: rest, program: mara_training)},
    {(day: 9, miles: 4, exercise: run, program: mara_training)},
    {(day: 10, miles: null, exercise: strength, program: mara_training)},
    {(day: 11, miles: 5, exercise: run, program: mara_training)},
    {(day: 12, miles: null, exercise: Exercise.find(cross_train.sample), program: mara_training)},
    {(day: 13, miles: null, exercise: rest, program: mara_training)},
    {(day: 14, miles: 8, exercise: run, program: mara_training)},
    #week 3
    {(day: 15, miles: null, exercise: rest, program: mara_training)},
    {(day: 16, miles: 3, exercise: run, program: mara_training)},
    {(day: 17, miles: null, exercise: strength, program: mara_training)},
    {(day: 18, miles: 6, exercise: run, program: mara_training)},
    {(day: 19, miles: null, exercise: Exercise.find(cross_train.sample), program: mara_training)},
    {(day: 20, miles: null, exercise: rest, program: mara_training)},
    {(day: 21, miles: 9, exercise: run, program: mara_training)},
    
    #week 4
    {(day: 22, miles: null, exercise: rest, program: mara_training)},
    {(day: 23, miles: 4, exercise: run, program: mara_training)},
    {(day: 24, miles: null, exercise: strength, program: mara_training)},
    {(day: 25, miles: 5, exercise: run, program: mara_training)},
    {(day: 26, miles: null, exercise: Exercise.find(cross_train.sample), program: mara_training)},
    {(day: 27, miles: null, exercise: rest, program: mara_training)},
    {(day: 28, miles: 10, exercise: run, program: mara_training)},
    
    #week 5
    {(day: 29, miles: null, exercise: rest, program: mara_training)},
    {(day: 30, miles: 3, exercise: run, program: mara_training)},
    {(day: 31, miles: null, exercise: strength, program: mara_training)},
    {(day: 32, miles: 4, exercise: run, program: mara_training)},
    {(day: 33, miles: null, exercise: Exercise.find(cross_train.sample), program: mara_training)},
    {(day: 34, miles: null, exercise: rest, program: mara_training)},
    {(day: 35, miles: 11, exercise: run, program: mara_training)},
    
    #week 5
    {(day: 35, miles: null, exercise: rest, program: mara_training)},
    {(day: 36, miles: 3, exercise: run, program: mara_training)},
    {(day: 37, miles: null, exercise: strength, program: mara_training)},
    {(day: 38, miles: 3, exercise: run, program: mara_training)},
    {(day: 39, miles: null, exercise: Exercise.find(cross_train.sample), program: mara_training)},
    {(day: 40, miles: null, exercise: rest, program: mara_training)},
    
])