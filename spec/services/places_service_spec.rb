require 'rails_helper'

RSpec.describe PlacesService, type: :service do
  describe 'search' do
    subject { described_class.new }

    it 'returns a list of places' do
      input = 'naf'
      valid_response = file_fixture('places_service_valid_response.json').read
      stub_request(:get, PlacesService::BASE_URL)
        .with(query: {"input" => input})
        .to_return(status: 200, body: valid_response)

      expect(subject.search(input)).to eq({ items: valid_response, status: 200 })
    end

    it 'returns an empty array for no results' do
      input = 'noncity'
      stub_request(:get, PlacesService::BASE_URL)
        .with(query: {"input" => input})
        .to_return(status: 200, body: [])

      expect(subject.search(input)).to eq({ items: [], status: 200 })
    end

    it 'returns an error message if the service is down' do
      input = 'naf'
      invalid_response_500 = file_fixture('places_service_500_response.html').read
      stub_request(:get, PlacesService::BASE_URL)
        .with(query: {"input" => input})
        .to_return(status: 500, body: invalid_response_500)

      expect(subject.search(input)).to eq({ items: [], error: invalid_response_500, status: 500 })
    end
  end
end