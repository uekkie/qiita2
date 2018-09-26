class PagesController < ApplicationController

  def index
    if current_user
      @items = current_user.items.order(updated_at: :desc)
      @stocked_items = current_user.stocked_items.order(updated_at: :desc)
    end
  end
end
