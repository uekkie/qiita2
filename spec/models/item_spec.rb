require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = User.new(
      email: 'test@test.com',
      password: 'testuser'
    )
  end
  # ユーザー、タイトル、本文があれば有効な状態であること
  it 'is valid with a title and body' do
    item = @user.items.new(
      title: 'Title',
      body: 'Body'
    )
    expect(item).to be_valid
  end
  # ユーザーがなければ無効な状態であること
  it 'is invlid without user' do
    item = Item.new(
      title: 'Title',
      body: 'Body'
    )
    item.valid?
    expect(item.errors[:user]).to include('を入力してください')
  end
  # タイトルがなければ無効な状態であること
  it 'is invalid without title' do
    item = @user.items.new(
      body: 'Body'
    )
    item.valid?
    expect(item.errors[:title]).to include("を入力してください")
  end
  # 本文がなければ無効な状態であること
  it 'is invalid without body' do
    item = @user.items.new(
      title: 'Title'
    )
    item.valid?
    expect(item.errors[:body]).to include("を入力してください")
  end
end
