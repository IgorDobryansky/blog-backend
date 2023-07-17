class CreatePostTable < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.string :username
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
