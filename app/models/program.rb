class Program < ApplicationRecord
    has_many :program_exercises
    has_many :exercises, through: :program_exercises
    has_many :user_programs
    has_many :users, through: :user_programs



    def set_routine_hash(week_array = Date::DAYNAMES)
        routine_hash = {}
        array = routine.split(", ").map{|e| e.split("-")}
        array.each_with_index.map {|type, index| routine_hash[week_array[index]] = type}
        routine_hash
    end

    def final_training_run
        (0.83 * race_mileage).to_f.round
    end


end
