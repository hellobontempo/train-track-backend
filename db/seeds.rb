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



Program.create(title: "Half Marathon Training", routine: "rest, run-first, strength, run-fast, cross_train, rest, run-long", race_mileage: 13.1, description: "Short Run: Nice, easy pace. If you're new to running it's okay to walk/run - Tempo Run: Maintain a competitive pace. Goal is to increase speed every week - Long Run: Aim to maintain a steady pace as your mileage increases closer to race day.")
Program.create(title: "Full Marathon Training", routine: "rest, run-first, strength, run-fast, cross_train, rest, run-long", race_mileage: 26.2, description: "Short Run: Nice, easy pace. If you're new to running it's okay to walk/run - Tempo Run: Maintain a competitive pace. Goal is to increase speed every week - Long Run: Aim to maintain a steady pace as your mileage increases closer to race day.")
