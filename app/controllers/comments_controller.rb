class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :create, :edit, :update, :destroy]
  
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @item.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
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
      @item = Item.find(params[:item_id])
    end
end
