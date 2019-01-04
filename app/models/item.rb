class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stocker_users, through: :stocks, source: :user
  has_many :likes, as: :likable, dependent: :destroy
  validates :title, :body, presence: true

  acts_as_ordered_taggable

  def stock_user(user_id)
    stocks.find_by(user_id: user_id)
  end

  def truncated_title
    title.truncate(40)
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  scope :recent, -> { order(updated_at: :desc) }

  scope :newer, -> { order(created_at: :desc) }
end
