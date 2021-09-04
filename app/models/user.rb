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
  # Allow Nested Form for Department
  accepts_nested_attributes_for :department
  accepts_nested_attributes_for :supervisor
  #validations
  validates :email, uniqueness: true

  def department_attributes=(department)
    if !department[:name].empty?
      self.department = Department.find_or_create_by(name: department[:name])
    end
    self.save
  end
  private

end
