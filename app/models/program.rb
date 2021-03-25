class Program < ApplicationRecord
    has_many :program_exercises
    has_many :exercises, through: :program_exercises



    def set_routine_hash
        routine_hash = {}
        array = routine.split(", ")
        new_arr = array.map{|e| e.split("-")}
        new_arr.each_with_index.map {|type, index| routine_hash[index] = type}
        routine_hash
    end


end
