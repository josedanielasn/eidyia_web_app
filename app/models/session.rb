class Session < ApplicationRecord
  belongs_to :program
  has_many :videos
  validates :session_name, presence: true, length: {minimum:2, maximum:20}
end
