class Batch < ApplicationRecord
  has_many :programs
  has_many :courses, through: :programs
end
