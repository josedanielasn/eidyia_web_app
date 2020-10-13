class Video < ApplicationRecord
  belongs_to :session
  has_many :comments
  has_one_attached :clip
  has_one_attached :thumbnail

  validates :video_title, presence: true, length: {minimum:2, maximum:30}
  validates :video_description, presence: true, length: {minimum:2, maximum:200}
end
