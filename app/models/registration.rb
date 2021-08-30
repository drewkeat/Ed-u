class Registration < ApplicationRecord
  belongs_to :course
  belongs_to :learner, class_name: "User"
end
