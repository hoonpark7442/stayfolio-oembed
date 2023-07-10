require 'rails_helper'

RSpec.describe "Oembeds", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/oembeds/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/oembeds/search"
      expect(response).to have_http_status(:success)
    end
  end

end
