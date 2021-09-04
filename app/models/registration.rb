class Registration < ApplicationRecord
  belongs_to :course
  belongs_to :learner, class_name: "User"
  validates :course_id, uniqueness: {scope: :learner_id}

  def duplicate?
    !!Registration.find_by(course_id: self.course_id ,learner_id: self.learner_id)
  end
end
