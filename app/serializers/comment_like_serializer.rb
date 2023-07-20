class CommentLikeSerializer < ActiveModel::Serializer
  attributes :comment_id, :user_id, :username, :vote

  belongs_to :comment
end
