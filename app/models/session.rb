class Session < ApplicationRecord
  belongs_to :program
  has_many :videos
end
