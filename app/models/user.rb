class User < ApplicationRecord
    has_many :user_programs
    has_many :programs, through: :user_programs
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
end
