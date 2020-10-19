class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_programs
  has_many :programs, through: :user_programs
  has_many :comments
  validates :firstname, presence: true, length: {minimum:2, maximum:20}
  validates :lastname, presence: true, length: {minimum:2, maximum:20}
  validates :username, presence: true, uniqueness: true, length: {minimum:3, maximum:30}
  validates :role, presence: true
  enum role: [:admin, :instructor, :student]
end
