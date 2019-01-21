class RemoveCheckedColumnToNotifications < ActiveRecord::Migration[5.1]
  def up
    remove_column :notifications, :checked
  end

  def down
    add_column :notifications, :checked, :boolean, null: false, default: false
  end
end
