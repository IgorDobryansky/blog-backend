class CreateLikesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :post_likes do |t|
      t.string :username
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
