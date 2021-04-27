class Assignment < ApplicationRecord
    belongs_to :student
    belongs_to :assignment_master
end
