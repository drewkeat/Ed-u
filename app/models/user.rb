class User < ApplicationRecord
  # has_secure_password
  belongs_to :department, optional: true
  belongs_to :supervisor, class_name: "User", optional: true
  has_many :subordinates, class_name: "User", foreign_key: "supervisor_id"
end
