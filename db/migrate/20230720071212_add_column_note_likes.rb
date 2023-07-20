class AddColumnNoteLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :post_likes, :vote, :string
  end
end
