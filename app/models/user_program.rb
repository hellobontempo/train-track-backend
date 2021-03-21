class UserProgram < ApplicationRecord
  belongs_to :program
  has_many :custom_programs
  has_many :exercises, through: :custom_programs
  #add belongs_to user when build User model
  

  before_save :sets_program
  before_save :make_personal_calendar
  validate :rest_days_are_valid


  def rest_days_are_valid
    absolute = (first_rest_day - second_rest_day).abs
    if absolute != 5 && absolute != 2  
      errors.add(:first_rest_day, "Rest days must be 2 or 5 days apart")
    end
  end

  def sets_program
    date = race_date - (program_length * 7)
    self.start_date = date 
  end

  ## make programs patterns of exercise numbers? ex: [6, 1, 4, 1, 3, 6, 1]
  def make_personal_calendar 
    self.make_custom_program
    week_start_index = self.first_rest_day
    self.set_exercises(6, week_start_index)
    self.set_exercises(1, week_start_index+1, run_type = "first")
    self.set_exercises(4, week_start_index+2)
    self.set_exercises(1, week_start_index+3, run_type = "fast")
    self.set_exercises(3, week_start_index+4)
    self.set_exercises(6, week_start_index+5)
    self.set_exercises(1, week_start_index+6, run_type = "long")
  end

  def make_custom_program # builds program skeleton
    d = 1
    w = 1
    self.program_length.times do
      7.times do 
      self.custom_programs.build(day: d, week: w, workout_date: self.start_date + d, is_race_day: ( (start_date + d) == self.race_date ? true : false) ) 
        d += 1
      end
      w += 1
    end
  end

  def set_exercises(exercise_id, weekday_index, run_type = "" ) #sets exercise_ids using weekday index number
   
    exercise_days = self.custom_programs.select do |program|
      self.work_out_days(weekday_index).include?(program.day)
    end
    exercise_days.map do |program|
      program.exercise_id = exercise_id
      if exercise_id == 1
        case run_type 
          when "first"
          program.week.odd? ? program.miles = 3 : program.miles = 4 
          when "fast"
            if program.week <= 3 
              program.miles = 3 + program.week
              elsif program.week == 4
              program.miles = program.week + 1
              elsif 
              program.miles = program.week - 1
            end
          when "long"
            if program.week != 6
              program.miles = program.week + 6
              else 
              program.miles = 13.1
            end
          else 
          return
        end

      end
    end
    exercise_days.each do |p|
      p.save
    end
  end

  def work_out_days(week_day) #creates array of days in a program that all have the same exercise
    d = week_day+1
    array = []
    program_length.times do 
        array.push(d) 
        d += 7
    end
    array
  end

  def program_length
    self.program.length_in_weeks
  end

end
