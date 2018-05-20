require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(
      email: 'test@test.com',
      password: 'testuser'
    )
    @item = @user.items.new(
      title: 'hoge',
      body: 'foo'
    )
  end
  # コメントユーザー、投稿、本文があれば有効な状態であること
  it 'is valid with a item and body' do
    comment = @item.comments.new(
      user: @user,
      body: 'this is comment'
    )
    expect(comment).to be_valid
  end
  # 本文がなければ無効な状態であること
  it 'is invalid without body' do
    comment = @item.comments.new(
      user: @user,
      body: nil
    )
    comment.valid?
    expect(comment.errors[:body]).to include('を入力してください')
  end
  # コメントユーザーがなければ無効な状態であること
  it 'is invalid without comment user' do
    comment = @item.comments.new(
      user: nil,
      body: 'this is comment'
    )
    comment.valid?
    expect(comment.errors[:user]).to include('を入力してください')
  end
  
  # 投稿がなければ無効な状態であること
  it 'is invalid without item' do
    comment = Comment.new(
      user: @user,
      body: 'this is comment'
    )
    comment.valid?
    expect(comment.errors[:item]).to include('を入力してください')
  end
end
