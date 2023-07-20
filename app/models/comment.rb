class Comment < ApplicationRecord
  belongs_to :post
  has_many :comment_likes, dependent: :delete_all

  validates :text, presence: true
end
