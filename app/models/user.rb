class User < ApplicationRecord
  # has_secure_password
  belongs_to :department, optional: true
  # Self referential roles
  belongs_to :supervisor, class_name: "User", optional: true
  has_many :subordinates, class_name: "User", foreign_key: "supervisor_id"
  # As facilitator
  has_many :courses, foreign_key: "facilitator_id"
  # As learner
  has_many :registrations, foreign_key: "learner_id"
  has_many :enrollments, through: :registrations, source: :course

end
