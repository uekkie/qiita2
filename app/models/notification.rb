class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  scope :recent, -> { includes(comment: [:user, :item]).order(created_at: :desc) }
end
