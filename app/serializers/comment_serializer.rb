class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :updated_at, :user_id, :username
  
  has_many :comment_likes
  belongs_to :post
end
