class Department < ApplicationRecord
    has_many :staff, class_name: "User", foreign_key: "department_id", dependent: :nullify
    has_many :courses, through: :staff, source: :courses
    #Validations
    validates :name, uniqueness: true
    #Scopes
    scope :facilitators, ->{staff.where(access: "facilitator")}
    scope :admin, ->{staff.where(access: "admin")}
end
