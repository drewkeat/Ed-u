class Course < ApplicationRecord
    belongs_to :facilitator, class_name: "User"
    has_many :registrations
    has_many :learners, through: :registrations, source: :learner
    has_many :reviews, as: :reviewable
    scope :upcoming, -> {where('start_time >= ?', Time.now).order(:start_time)}
    scope :past, -> {where('start_time <= ?', Time.now)}
    before_save :convert_status

    def convert_status
        case self.status
            when "1"
                self.status = "approved"
            when "0"
                self.status = "denied"
            else
                self.status = "pending"
        end
    end

    def display_schedule
        "#{self.start_time.strftime("%b %e, %l:%M %p")} - #{self.end_time.strftime("%l:%M %p")}"
    end
end
