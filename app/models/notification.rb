class Notification < ApplicationRecord
  belongs_to :item
  belongs_to :owner, class_name: "User"
  belongs_to :sender, class_name: "User"
  validates :owner_id, :sender_id, presence: true
end
