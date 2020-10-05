class Program < ApplicationRecord
  belongs_to :course
  belongs_to :batch
  has_many :user_programs
  has_many :users, through: :user_programs
  has_many :sessions
end
