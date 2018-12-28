class UniqueRestrictToLike < ActiveRecord::Migration[5.1]
  def up
    remove_index :likes, ["likable_type", "likable_id"]
    add_index    :likes, ["likable_type", "likable_id", "user_id"], unique: true
  end

  def down
    remove_index :likes, ["likable_type", "likable_id", "user_id"]
    add_index    :likes, ["likable_type", "likable_id"]
  end
end
