require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is not valid without a name' do
      user = build(:user, first_name: nil)
      expect(user.valid?).to be_falsey
    end

    it 'is not valid without a email' do
      user = build(:user, email: nil)
      expect(user.valid?).to be_falsey
    end

    it 'is not valid without a valid email' do
      user = build(:user, email: 'nomail')
      expect(user.valid?).to be_falsey
    end
  end
end
