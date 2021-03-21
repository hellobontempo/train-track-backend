class UserProgram < ApplicationRecord
  belongs_to :program
  has_many :custom_programs
  has_many :exercises, through: :custom_programs
  #add belongs_to user when build User model
  

  before_save :sets_program
  validate :rest_days_are_valid


  def rest_days_are_valid
    absolute = (first_rest_day - second_rest_day).abs
    if absolute != 5 && absolute != 2  
      errors.add(:first_rest_day, "Rest days must be 2 or 5 days apart")
    end
  end

  ## make programs patterns of exercise numbers? ex: [6, 1, 4, 1, 3, 6, 1]
  def make_personal_calendar 
    week_start = self.first_rest_day
    self.set_exercises(6, week_start)
    self.set_exercises(1, week_start+1)
    self.set_exercises(4, week_start+2)
    self.set_exercises(1, week_start+3)
    self.set_exercises(3, week_start+4)
    self.set_exercises(6, week_start+5)
    self.set_exercises(1, week_start+6)
  end

  def set_exercises(exercise_id, weekday_index) #sets exercise_ids using weekday index number
    exercise_days = self.custom_programs.select do |program|
      self.work_out_days(weekday_index).include?(program.day)
    end
    exercise_days.map do |program|
      program.exercise_id = exercise_id
    end
    exercise_days.each do |p|
      p.save
    end
  end

  def sets_program
    date = race_date - (program_length * 7)
    self.start_date = date - (first_rest_day - date.wday).abs 
  end

  def make_custom_program # builds program skeleton
    d = 1
    w = 1
    self.program_length.times do
      7.times do 
      self.custom_programs.build(day: d, week: w)
        d += 1
      end
      w += 1
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
