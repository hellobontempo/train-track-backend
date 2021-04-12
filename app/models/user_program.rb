class UserProgram < ApplicationRecord
  belongs_to :program
  belongs_to :user
  has_many :custom_programs, -> { order(:day) }, dependent: :destroy
  has_many :exercises, through: :custom_programs, dependent: :destroy
  has_many :cross_train_exercise_preferences, foreign_key: :cross_train_program_id, dependent: :destroy
  has_many :preferred_exercises, through: :cross_train_exercise_preferences, source: :cross_train_exercise, dependent: :destroy

  #add belongs_to user when build User model
  validates :length_in_weeks, numericality: { greater_than_or_equal_to: 4 }
  validates :length_in_weeks,  numericality: { less_than_or_equal_to: 24 }
  validates :preferred_exercises, :username, :race_date, :length_in_weeks, presence: true
  before_save :set_start_date
  after_save  :make_personal_calendar
  
  
  def set_start_date
    self.start_date = (race_date - (program_length * 7)) + 1
  end

  ## program is patterns("routine") of exercise numbers: ex: [6, 1, 4, 1, 3, 6, 1]
  def make_personal_calendar 
    start_date = (race_date - (program_length * 7)) + 1
    make_custom_program
    week_array =  Date::DAYNAMES.slice(start_date.wday, 7) + Date::DAYNAMES.slice(0, start_date.wday)
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
    exercise_by_weekday(weekday_index).each do |cp| #set custom program
      cp.exercise_id = exercise.sample
      if exercise.sample == 1
        case run_type
          when "first"
            cp.week.odd? ? cp.miles = 3 : cp.miles = 4 
            cp.exercise = Exercise.find_by_name("Short Run")
          when "fast"
            cp.exercise = Exercise.find_by_name("Tempo Run")
            if cp.week <= program_length/2 + 1
              cp.miles = ((program.race_mileage/2)/(program_length/2) * cp.week) + 1
            else cp.week > program_length/2 + 1
              cp.week.odd? ? cp.miles = (program.race_mileage/2) : cp.miles = (program.race_mileage/2 - 1)
            end
          when "long"
            cp.exercise = Exercise.find_by_name("Long Run")
            cp.week == program_length ? cp.miles = program.race_mileage : cp.miles = set_long_run(cp.week)
          end
      end
      cp.save
    end
  end

  def set_long_run(week)
    if week < (program_length - (program.final_training_run - program.race_mileage/2))
      week.odd? ? miles = (program.race_mileage/2) : miles = (program.race_mileage/2 + 1)
    else  
      miles = program.final_training_run - ((program_length - 1) - week)
    end
    miles
  end


  def exercise_by_weekday(wkday_index)
    custom_programs.select {|program| program.workout_date.wday == wkday_index}
  end

  def program_length
    self.length_in_weeks
  end

end
