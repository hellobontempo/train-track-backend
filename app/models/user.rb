class User < ApplicationRecord
    has_many :user_programs
    has_many :programs, through: :user_programs
    has_secure_password
end
