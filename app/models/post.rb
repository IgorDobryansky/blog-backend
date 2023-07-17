class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  
  validates :text, presence: true
  validates :user_id, presence: true
  validates :username, presence: true
end
