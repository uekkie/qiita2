class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = Item.where(user: current_user.following).recent.page
    @user = current_user
  end
end
