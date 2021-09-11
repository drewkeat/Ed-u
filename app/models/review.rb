class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  scope :facilitator, ->(user_id) { where('reviewable_type = ? AND reviewable_id = ?', :User, user_id) }
  scope :course, ->(course_id) { where('reviewable_type = ? AND reviewable_id = ?', :Course, course_id) }
end
