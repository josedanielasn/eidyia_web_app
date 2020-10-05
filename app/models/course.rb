class Course < ApplicationRecord
  has_many :programs
  has_many :batches, through: :programs
  validates :course_name, presence: true, length: {minimum:2, maximum:20}
end
