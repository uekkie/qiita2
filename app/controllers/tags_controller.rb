class TagsController < ApplicationController
  def show
    @tag_name = params[:name]
    @items = Item.tagged_with(@tag_name, any: true)
    @followers = User.tagged_with(@tag_name, any: true).count
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
