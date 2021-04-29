class Course < ApplicationRecord
    has_many :students
    has_many :assignment_masters
end
