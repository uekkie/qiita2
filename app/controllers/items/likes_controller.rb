class Items::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    @like = @item.likes.create!(user: current_user)
    @item.reload
  end

  def destroy
    like = @item.likes.find_by!(user: current_user)
    like.destroy!
    @item.reload
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
