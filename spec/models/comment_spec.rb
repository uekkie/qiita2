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

  it '本文がなければ無効な状態であること' do
    comment = @item.comments.new(
      user: @user,
      body: nil
    )
    comment.valid?
    expect(comment.errors[:body]).to include('を入力してください')
  end

  it 'コメントユーザーがなければ無効な状態であること' do
    comment = @item.comments.new(
      user: nil,
      body: 'this is comment'
    )
    comment.valid?
    expect(comment.errors[:user]).to include('を入力してください')
  end

  it '投稿がなければ無効な状態であること' do
    comment = Comment.new(
      user: @user,
      body: 'this is comment'
    )
    comment.valid?
    expect(comment.errors[:item]).to include('を入力してください')
  end
end
