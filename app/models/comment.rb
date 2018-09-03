class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 1024 * 10 }
  belongs_to :user
  belongs_to :post
end
