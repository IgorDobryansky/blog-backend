class RemoveFieldFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :note_id, :integer
    remove_column :users, :comment_id, :integer
  end
end
