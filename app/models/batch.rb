class Batch < ApplicationRecord
  has_many :programs
  has_many :courses, through: :programs
  validates :batch_name, presence: true, length: {minimum:2, maximum:20}
end
