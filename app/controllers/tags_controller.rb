class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @items = Item.tagged_with(@tag.name, any: true)
    @users_count = User.tagged_with(@tag.name, any: true).count
  end

  def create
    tag = ActsAsTaggableOn::Tag.find(params[:tag_id])
    current_user.tag_list.add(tag.name)
    current_user.save!
    redirect_to tag_url(tag.name)
  end

  def destroy
    tag_name = params[:id]
    current_user.tag_list.remove(tag_name)
    current_user.save!
    redirect_to tag_url(tag_name)
  end
end
