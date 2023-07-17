class RemoveFieldFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :comment_id, :integer
  end
end
