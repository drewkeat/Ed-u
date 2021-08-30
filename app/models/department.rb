class Department < ApplicationRecord
    has_many :staff, class_name: "User", foreign_key: "department_id"
end
