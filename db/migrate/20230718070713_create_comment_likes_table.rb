class CreateCommentLikesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_likes do |t|
      t.string :username
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
