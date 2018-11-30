class TagsController < ApplicationController
  before_action :authenticate_user!,only: %i(create destroy)

  def show
    @tag_name = params[:name]
    @items = Item.tagged_with(@tag_name)
    @followers = User.tagged_with(@tag_name).count
  end

  def create
    tag_name = params[:name]
    current_user.tag_list.add(tag_name)
    current_user.save!
    redirect_to tag_url(tag_name)
  end

  def destroy
    tag_name = params[:name]
    current_user.tag_list.remove(tag_name)
    current_user.save!
    redirect_to tag_url(tag_name)
  end
end
