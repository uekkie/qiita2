class Comments::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def create
    @like = @comment.likes.create!(user: current_user)
    @comment.reload
  end

  def destroy
    like = @comment.likes.find_by!(user: current_user)
    like.destroy!
    @comment.reload
  end

  private
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
