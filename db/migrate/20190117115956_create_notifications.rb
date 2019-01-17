class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :owner_id, null: false
      t.integer :sender_id, null: false
      t.references :item, foreign_key: true
      t.boolean :confirmed, null: false, default: false

      t.timestamps
    end

    add_index :notifications, :owner_id
    add_index :notifications, :sender_id
  end
end
