class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true

  acts_as_ordered_taggable
end
