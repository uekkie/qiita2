class Comments::NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def destroy
    notification = current_user.notifications.find_by_comment_id(@comment.id)
    notification.destroy!
  end

  private
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
