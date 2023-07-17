class CreateUserTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :note_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
