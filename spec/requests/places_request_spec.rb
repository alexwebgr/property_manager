require 'rails_helper'

RSpec.describe "Places", type: :request do

  describe "GET /search" do
    it "returns http success" do
      input = 'naf'
      valid_response = file_fixture('places_service_valid_response.json').read

      stub_request(:get, PlacesService::BASE_URL)
        .with(query: {"input" => input})
        .to_return(status: 200, body: valid_response)

      get "/places/search?input=#{input}"
      expect(response).to have_http_status(:success)
    end
  end

end
