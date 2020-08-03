require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:creator) { build(:user) }
  let(:event) { build(:event) }
  context 'Validations' do
    it 'is valid with valid attributes' do
      event.creator = creator
      expect(event).to be_valid
    end
    it 'is not valid without an event date' do
      event.event_date = nil
      expect(event).to_not be_valid
    end
    it 'is not valid without a description' do
      event.description = nil
      expect(event).to_not be_valid
    end
    it 'shouldn\'t save successfuly without some attributes' do
      expect(event.save).to eql(false)
    end
  end
end
