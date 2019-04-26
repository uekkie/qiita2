class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :likes, as: :likable, dependent: :destroy
  has_many :notifications, as: :notificatable, dependent: :destroy

  validates :body, presence: true


  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
