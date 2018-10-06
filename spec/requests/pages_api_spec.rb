require 'rails_helper'

RSpec.describe "Pages API", type: :request do
  describe "GET #index" do
    it "ルートの表示が成功すること" do
      get root_url
      expect(response.status).to eq 200
    end
  end
end
