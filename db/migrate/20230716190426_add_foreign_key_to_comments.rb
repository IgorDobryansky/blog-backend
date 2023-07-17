class AddForeignKeyToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :comments, column: :id
  end
end
