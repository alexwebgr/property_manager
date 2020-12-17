require 'rails_helper'

RSpec.describe "Places", type: :request do

  describe "GET /search" do
    it "returns http success" do
      get "/places/search?input=naf"
      expect(response).to have_http_status(:success)
    end
  end

end
