require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    let(:user) { build(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end
    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end
    it 'is not valid without a username' do
      user.username = nil
      expect(user).to_not be_valid
    end
    it 'should save successfuly' do
      expect(user.save).to eql(true)
    end
    it do
      should validate_uniqueness_of(:username)
    end
    it do
      should validate_uniqueness_of(:email)
    end
  end

  context 'Associations' do
    describe 'has many events' do
      it { is_expected.to have_many(:events) }
    end
    describe 'has many attendances' do
      it { is_expected.to have_many(:attendances) }
    end
    describe 'has many attendances' do
      it { is_expected.to have_many(:attended_events) }
    end
  end
end
