class PagesController < ApplicationController

  def index
    if current_user
      @items = current_user.items.recent
      @stocked_items = current_user.stocked_items.recent
    end
  end
end
