class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :item, counter_cache: true
  validates :user_id, :item_id, presence: true
end
