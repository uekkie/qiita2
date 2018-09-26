class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :user, foreign_key: true, null: false, type: :integer
      t.references :item, foreign_key: true, null: false, type: :integer

      t.timestamps
    end
  end
end
