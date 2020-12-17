require 'rails_helper'

RSpec.describe PlacesService, type: :service do
  describe 'search' do
    subject { described_class.new }

    it 'returns a list of places' do
      input = 'naf'
      valid_response = file_fixture('places_service_valid_response.rb').read
      allow(subject).to receive(:query).with(input).and_return({ items: valid_response, status: 200 })

      expect(subject.search(input)).to eq({ items: valid_response, status: 200 })
    end

    it 'returns an empty array for no results' do
      input = 'noncity'
      allow(subject).to receive(:query).with(input).and_return({ items: [], status: 200 })

      expect(subject.search(input)).to eq({ items: [], status: 200 })
    end
  end
end