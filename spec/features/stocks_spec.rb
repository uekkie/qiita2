require 'rails_helper'

RSpec.feature "Stocks", type: :feature do
  scenario 'ユーザーは投稿をストックできること', js: true do
    item = create(:item)
    user = create(:hiroshi)
    sign_in user

    visit user_item_path item.user, item
    expect(item.stocks.count).to eq 0
    expect(find('#stock-button')).to have_text('ストックする 0')

    click_button 'ストックする'
    expect(find('#stock-button')).to have_text('ストック解除 1')
  end
end
