class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :likable, polymorphic: true, index: true
      t.references :user, foreign_key: true, null: false, type: :integer

      t.timestamps
    end
  end
end
