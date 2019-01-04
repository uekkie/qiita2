class NotNullRestrictToLike < ActiveRecord::Migration[5.1]
  def change
    change_column :likes, :likable_type, :string, null: false
    change_column :likes, :likable_id, :bigint, null: false
  end
end
