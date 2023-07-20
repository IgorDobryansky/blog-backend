class PostLike < ApplicationRecord
  belongs_to :post

  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :username, presence: true
  validates :vote, presence: true
end
