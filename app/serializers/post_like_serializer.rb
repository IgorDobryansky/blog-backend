class PostLikeSerializer < ActiveModel::Serializer
  attributes :post_id, :user_id, :username, :vote

  belongs_to :post
end
