class Notification < ApplicationRecord
  belongs_to :notificatable, polymorphic: true
  belongs_to :user

  validates :notificatable_type, uniqueness: {:scope => [:notificatable_id, :user_id] }
end
