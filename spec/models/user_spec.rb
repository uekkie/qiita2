require 'rails_helper'

RSpec.describe User, type: :model do
  # メール、パスワードがあれば有効な状態であること
  it "is valid with a email and password" do
    user = create(:user)
    expect(user).to be_valid
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without email address" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    create(:user, email: 'same@email.com')
    user = build(:user, email: 'same@email.com')
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  # 別のユーザーをフォロー・フォロー解除できること
  it 'does follow and unfollow other user' do
    user1 = create(:user)
    user2 = create(:user)

    user1.follow(user2)
    expect(user1).to be_following(user2)

    user1.unfollow(user2)
    expect(user1).to_not be_following(user2)
  end
end
