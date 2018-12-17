class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    follower_ids = Relationship.where(follower_id: current_user.id).pluck(:followed_id)
    @items = Item.where(user_id: follower_ids).recent.page
    @user = current_user
  end
end
