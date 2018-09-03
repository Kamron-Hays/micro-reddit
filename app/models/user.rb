class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 64 }
  validates :password, presence: true, length: { minimum: 8, maximum: 64 }
  has_many :posts
  has_many :comments
end
