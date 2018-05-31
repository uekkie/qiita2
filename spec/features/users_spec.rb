require 'rails_helper'

RSpec.feature "Users", type: :feature do
  given(:user) { create(:user) }

  # ユーザーはあたらしい投稿を作成することができる
  scenario "user creates a new item" do
    visit root_path
    click_link 'ログイン'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect {
      click_link 'Atiiq に投稿'
      fill_in 'item_title', with: 'Test Item'
      fill_in 'item_body', with: 'Trying out Capybara'
      click_button '投稿する'

      expect(page).to have_content '作成しました'
      expect(page).to have_content 'Test Item'
    }.to change(user.items, :count).by(1)
  end
end
