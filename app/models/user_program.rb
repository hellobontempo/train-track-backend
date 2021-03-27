class UserProgram < ApplicationRecord
  belongs_to :program
  has_many :custom_programs, -> { order(:day) }
  has_many :exercises, through: :custom_programs
  has_many :cross_train_exercise_preferences, foreign_key: :cross_train_program_id
  has_many :preferred_exercises, through: :cross_train_exercise_preferences, source: :cross_train_exercise

  #add belongs_to user when build User model

  before_save :set_start_date
  after_save  :make_personal_calendar
  
  
  
  

  def set_start_date
    self.start_date = (race_date - (program_length * 7)) + 1
  end

  ## program is patterns("routine") of exercise numbers: ex: [6, 1, 4, 1, 3, 6, 1]
  def make_personal_calendar 
    start_date = (race_date - (program_length * 7)) + 1
    make_custom_program
    weekday_index = start_date.wday
    week_array =  Date::DAYNAMES.slice(weekday_index, 7) + Date::DAYNAMES.slice(0, weekday_index)
    program_routine_hash = program.set_routine_hash(week_array)
    program_routine_hash.each do | key, value|
     value[0] == "cross_train" ? exercise = preferred_exercises.ids : exercise = [Exercise.find_by_exercise_type(value[0]).id]
      set_exercises(exercise, Date::DAYNAMES.find_index(key), run_type = value[1])
    end
  end

  def make_custom_program # builds program skeleton, creates CustomPrograms
    d = 0
    w = 1
    self.program_length.times do
      7.times do 
      date = self.start_date + d
      self.custom_programs.build(day: d + 1, week: w, workout_date: date, is_race_day: (date == self.race_date ? true : false) ) 
        d += 1
      end
      w += 1
    end
  end



  def set_exercises(exercise, weekday_index, run_type = "" ) #sets exercises, saves CustomPrograms`
    exercise_by_weekday(weekday_index).each do |program|
      program.exercise_id = exercise.sample
      if exercise.sample == 1
        case run_type
          when "first"
            program.week.odd? ? program.miles = 3 : program.miles = 4 
          when "fast"
            if program.week <= program_length/2
              program.miles = 3 + program.week
            elsif program.week == program_length/2 + 1
              program.miles = program.week + 1
            else 
              program.miles = program.week - 1
            end
          when "long"
            program.week == program_length ? program.miles = 13 : program.miles = program.week + 6
          end
      end
      program.save
    end
  end

  def exercise_by_weekday(wkday_index)
    custom_programs.select {|program| program.workout_date.wday == wkday_index}
  end

  def program_length
    self.program.length_in_weeks
  end

end
