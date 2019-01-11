class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :notificatable, polymorphic: true, index: true
      t.integer :notificatable_id, null: false
      t.string :notificatable_type, null: false

      t.references :user, foreign_key: true, null: false, type: :integer
      t.timestamps
    end
    add_index    :notifications, ["notificatable_type", "notificatable_id", "user_id"], unique: true
  end
end
