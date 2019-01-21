class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_item

  def create
    @comment = @item.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @user.notifications.create!(owner:@user, sender:current_user, item:@item)
        format.html { redirect_to user_item_url(@user, @item), notice: '作成しました' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_item
      @item = @user.items.find(params[:item_id])
    end
end
