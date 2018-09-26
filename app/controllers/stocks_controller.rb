class StocksController < ApplicationController
  before_action :set_item

  def create
    @stock = Stock.create(user_id: current_user.id, item_id: @item.id)
    @stocks = Stock.where(item_id: @item.id)
    redirect_to user_item_path(@item.user, @item)
  end

  def destroy
    stock = Stock.find_by(user_id: current_user.id, item_id: @item.id)
    stock.destroy
    @stocks = Stock.where(item_id: @item.id)
    redirect_to user_item_path(@item.user, @item)
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
