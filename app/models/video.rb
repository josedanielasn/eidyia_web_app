class Video < ApplicationRecord
  belongs_to :session
  has_many :comments
  validates :video_title, presence: true, length: {minimum:2, maximum:30}
  validates :description, presence: true, length: {minimum:2, maximum:200}
end
