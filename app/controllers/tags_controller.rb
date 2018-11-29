class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @items = Item.tagged_with(@tag.name, any: true)
    @users_count = User.tagged_with(@tag.name, any: true).count
  end
end
