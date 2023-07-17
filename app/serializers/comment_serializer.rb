class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :post_id, :created_at, :updated_at, :user_id, :username
  # belongs_to :post
end
