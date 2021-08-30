class Course < ApplicationRecord
    belongs_to :facilitator, class_name: "User"
    has_many :registrations
    has_many :learners, through: :registrations, source: :learner
end
