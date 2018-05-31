class AddNotNullRestrictToComment < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :body, :string, null: false, default: ''
    change_column :comments, :item_id, :integer, null: false
    change_column :comments, :user_id, :integer, null: false
  end
end
