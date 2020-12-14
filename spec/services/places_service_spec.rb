require 'rails_helper'

RSpec.describe PlacesService, type: :service do
  describe 'search' do
    subject { described_class.new }

    it 'returns a list of places' do
      input = 'noncity'
      valid_response = file_fixture('places_service_valid_response.rb').read
      allow(subject).to receive(:query).with(input).and_return(valid_response)

      expect(subject.search(input)).to eq(valid_response)
    end

    it 'returns an empty array for no results' do
      input = 'noncity'
      allow(subject).to receive(:query).with(input).and_return([])

      expect(subject.search(input)).to eq([])
    end
  end
end