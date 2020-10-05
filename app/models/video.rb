class Video < ApplicationRecord
  belongs_to :session
  has_many :comments
end
