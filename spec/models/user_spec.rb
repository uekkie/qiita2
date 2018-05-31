require 'rails_helper'

RSpec.describe User, type: :model do
  # メール、パスワードがあれば有効な状態であること
  it "is valid with a email and password" do
    user = User.new(
      email: "test@test.com",
      password: "testuser"
    )
    expect(user).to be_valid
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      email: "test@test.com",
      password: "testuser"
    )
    user = User.new(
      email: "test@test.com",
      password: "testuser"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
