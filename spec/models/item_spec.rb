require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = User.new(
      email: 'test@test.com',
      password: 'testuser'
    )
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
end
