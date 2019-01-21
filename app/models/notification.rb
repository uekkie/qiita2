class Notification < ApplicationRecord
  belongs_to :item
  belongs_to :owner, class_name: "User"
  belongs_to :sender, class_name: "User"
  validates :owner_id, :sender_id, presence: true

  scope :unread, -> { includes(:owner, :sender, :item).where(confirmed: false).order(created_at: :desc).limit(5) }
end
