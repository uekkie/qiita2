require 'rails_helper'

RSpec.feature "Users", type: :feature do
  given(:user) { create(:user) }

  # ユーザーはあたらしい投稿を作成することができる
  scenario "user creates a new item" do
    visit root_path
    click_link 'ログイン'

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password

    click_button 'ログイン'

    click_link '投稿する'
    fill_in 'item_title', with: 'Test Item'
    fill_in 'item_body', with: 'Trying out Capybara'

    expect {
      click_button '投稿する'
    }.to change(user.items, :count).by(1)

    expect(page).to have_content '作成しました'
    expect(page).to have_content 'Test Item'
  end
end
