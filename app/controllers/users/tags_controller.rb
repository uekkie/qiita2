class Users::TagsController < ApplicationController
  before_action :authenticate_user!

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
