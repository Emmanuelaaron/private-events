require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let(:user) { build(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end
    it 'is not valid without an email' do
      user.email = nil
      expect(user.save).to eql(false)
    end
    it 'is not valid without a username' do
      user.username = nil
      expect(user).to_not be_valid
    end
    it 'should save successfuly' do
      expect(user.save).to eql(true)
    end
  end
end
