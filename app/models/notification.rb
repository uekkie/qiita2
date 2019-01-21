class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  scope :unchecked, -> { includes(comment: [:user, :item]).where(checked: false).order(created_at: :desc) }
end
