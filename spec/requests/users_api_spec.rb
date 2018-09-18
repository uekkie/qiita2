require 'rails_helper'

RSpec.describe User, type: :request do
  before do
    user = create(:hiroshi)
    sign_in user
  end
  describe "GET #index" do
    it "ユーザー一覧のリクエストが成功すること" do
      get users_url
      expect(response.status).to eq 200
    end

    it "ユーザーアドレスが表示されていること" do
      get users_url
      expect(response.body).to include 'ueki@test.com'
    end
  end
end
