class AddPostAndUserIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :post_id, :integer

    add_index :comments, [:user_id, :post_id]
    add_index :comments, :post_id
  end
end
