class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = @user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to [@user, @item], notice: '作成しました' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [@user, @item], notice: '更新しました' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user), notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def set_user
      if user_signed_in?
        @user = current_user
      else
        @user = @item.user
      end
    end

    def item_params
      params.require(:item).permit(:title, :body)
    end
end
