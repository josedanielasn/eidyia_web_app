class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video
  validates :message_body, presence: true, length: {minimum:1, maximum:200}
end
