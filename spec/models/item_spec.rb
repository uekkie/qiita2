require 'rails_helper'

RSpec.describe Item, type: :model do

  it 'user, title, body があれば有効であること' do
    item = create(:item)
    expect(item).to be_valid
  end

  it 'ユーザーがなければ無効' do
    item = build(:item, user: nil)
    item.valid?
    expect(item.errors[:user]).to include('を入力してください')
  end
end
