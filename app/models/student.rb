class Student < ApplicationRecord
    belongs_to :course
    has_many :assignments
end
