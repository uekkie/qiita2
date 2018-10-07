class AddMissingUniqueIndicesToStocks < ActiveRecord::Migration[5.1]
  def change
    add_index :stocks, [:user_id, :item_id], unique: true
  end
end
