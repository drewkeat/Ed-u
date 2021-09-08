class User < ApplicationRecord
  has_secure_password
  belongs_to :department, optional: true
  # Self referential roles
  belongs_to :supervisor, class_name: "User", optional: true
  has_many :subordinates, class_name: "User", foreign_key: "supervisor_id"
  # As facilitator
  has_many :courses, foreign_key: "facilitator_id"
  has_many :reviews, as: :reviewable
  # As learner
  has_many :registrations, foreign_key: "learner_id"
  has_many :enrollments, through: :registrations, source: :course
  # As reviewer
  has_many :submitted_reviews, class_name: "Review", foreign_key: "reviewer_id"
  #validations
  validates :email, uniqueness: true
  validates :name, :email, presence: true
  #scopes
  scope :facilitators, ->{where(access: "facilitator")}
  scope :admin, ->{where(access: "admin")}
  private

end
