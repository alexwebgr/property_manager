require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/sessions/login"
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(properties_url)
    end
  end
end
