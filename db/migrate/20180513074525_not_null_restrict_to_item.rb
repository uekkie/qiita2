class NotNullRestrictToItem < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :title, :string, null: false, default: ''
    change_column :items, :body, :string, null: false, default: ''
  end
end
