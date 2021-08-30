class Course < ApplicationRecord
    belongs_to :facilitator, class_name: "User"
    has_many :registrations
    has_many :learners, through: :registrations, source: :learner
    has_many :reviews, as: :reviewable
end
