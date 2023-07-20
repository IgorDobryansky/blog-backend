class AddColumnCommentLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :comment_likes, :vote, :string
  end
end
