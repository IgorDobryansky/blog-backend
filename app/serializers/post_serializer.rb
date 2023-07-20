class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :username, :user_id
  
  has_many :comments
  has_many :post_likes
end
