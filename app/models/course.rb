class Course < ApplicationRecord
    belongs_to :facilitator, class_name: "User"
    has_many :registrations
    has_many :learners, through: :registrations, source: :learner
    has_many :reviews, as: :reviewable
    scope :upcoming, -> {where('start_time >= ?', Time.now).order(:start_time)}
    scope :past, -> {where('start_time <= ?', Time.now)}
end
