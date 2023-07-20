class CommentLike < ApplicationRecord
  belongs_to :comment

  validates :comment_id, presence: true
  validates :user_id, presence: true
  validates :username, presence: true
end
