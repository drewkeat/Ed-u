class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
  scope :facilitator, ->(user) { where('reviewable_type = ? AND reviewable_id = ?', :Course, user.course_ids) }

end
