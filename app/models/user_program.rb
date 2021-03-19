class UserProgram < ApplicationRecord
  belongs_to :program

  validate :rest_days_are_valid

  def rest_days_are_valid
    absolute = (first_rest_day - second_rest_day).abs
    if absolute != 5 && absolute != 2  
      errors.add(:first_rest_day, "Rest days must be 2 or 5 days apart")
    end
  end
  #add belongs_to user when build User model


  def make_personal_calendar 
    #takes out rest days, 
    self.first_rest_day
    self.start_date.wday # returns integer of start_date
    self.race_date.wday # returns integer of start_date

  end


end
