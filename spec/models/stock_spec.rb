require 'rails_helper'

RSpec.describe Stock, type: :model do
  # userはitemをストックできること
  it 'is valid with user and item' do
    user = create(:user)
    item = create(:item)

    expect(item.stocks_count).to eq 0
    stock = Stock.create(user: user, item: item)

    expect(stock).to be_valid
  end

  # ストックした数が変化すること
  it 'count changes' do
    user = create(:user)
    item = create(:item)

    expect(item.stocks_count).to eq 0
    stock = Stock.create(user: user, item: item)
    expect(item.stocks_count).to eq 1
    stock.destroy!
    expect(item.stocks_count).to eq 0
  end

  # おなじitemを重複してストックできないこと
  it 'is invalid duplicate item' do
    user = create(:user)
    item = create(:item)

    Stock.create(user: user, item: item)
    stock = Stock.new(user: user, item: item)
    expect(stock).to_not be_valid
  end

  # 自分の投稿はストックできないこと
  xit "does'nt self post item" do
    # 以下をパスさせたい
    item = create(:item)

    stock = Stock.create(user: item.user, item: item)

    expect(stock).to_not be_valid
  end
end
