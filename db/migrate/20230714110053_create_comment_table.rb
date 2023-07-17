class CreateCommentTable < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :username
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
