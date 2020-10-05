class Course < ApplicationRecord
  has_many :programs
  has_many :batches, through: :programs
end
