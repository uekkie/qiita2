class StocksController < ApplicationController
  before_action :set_item

  def create
    @stock = current_user.stocks.create!(user_id: current_user.id, item_id: @item.id)
    @item.reload
  end

  def destroy
    stock = current_user.stocks.find_by!(user_id: current_user.id, item_id: @item.id)
    stock.destroy!
    @item.reload
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
