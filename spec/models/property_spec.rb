require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'Validations' do
    it 'is not valid without a title' do
      property = build(:property, title: nil)
      expect(property.valid?).to be_falsey
    end

    it 'is not valid if the title is longer than 155 characters' do
      property = build(:property, title: 'X' * 156)
      expect(property.valid?).to be_falsey
    end

    it 'is not valid without an area' do
      property = build(:property, area: nil)
      expect(property.valid?).to be_falsey
    end

    it 'is not valid without a placeId' do
      property = build(:property, placeId: nil)
      expect(property.valid?).to be_falsey
    end

    it 'is not valid without an price' do
      property = build(:property, price: nil)
      expect(property.valid?).to be_falsey
    end

    it 'is not valid if the price is not an integer' do
      property = build(:property, price: 'price')
      expect(property.valid?).to be_falsey
    end

    it 'is valid without an extra description' do
      property = build(:property, extra_description: nil)
      expect(property.valid?).to be_truthy
    end

    it 'is creates a new property' do
      property = build(:property)
      expect(property.valid?).to be_truthy
    end
  end
end
