class NotUserRestrictToItem < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :user_id, :integer, null: false
  end
end
