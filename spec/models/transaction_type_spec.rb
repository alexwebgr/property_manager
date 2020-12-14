require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  describe 'Validations' do
    it 'is not valid without label' do
      transaction_type = build(:transaction_type, label: nil)
      expect(transaction_type.valid?).to be_falsey
    end

    it 'is generates a handle from the label' do
      transaction_type = create(:transaction_type, label: 'Buy')
      expect(transaction_type.handle).to eq 'buy'
    end

    it 'is generates a handle from the label' do
      transaction_type = create(:transaction_type, label: 'label with spaces and 123')
      expect(transaction_type.handle).to eq 'labelwithspacesand'
    end
  end
end
