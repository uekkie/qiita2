class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user

  validates :likable_type, uniqueness: {:scope => :likable_id}
end
