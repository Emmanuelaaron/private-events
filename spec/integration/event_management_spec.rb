require 'rails_helper'

# create event
# invite attendees
# be able to see all events created
# be able to see all events one is invited to
# be able to see upcoming events in the upcoming category
# be able to see the past events in the past category
require 'rails_helper'

RSpec.describe 'Event management', type: :feature do
  let(:creator) { create(:user) }
  let(:invitee) { create(:user) }
  let(:event) { build(:event) }
  context 'Create event' do
    describe 'with valid input' do
      it 'successfully creates an event' do
        event.creator = creator
        visit root_path
        click_on 'Login'
        fill_in 'user_username', with: creator.username
        click_button 'Log in'
        click_link 'Create Event'
        fill_in 'event_description', with: event.description
        fill_in 'event_event_date', with: event.event_date
        click_button 'Create Event'
        expect(page).to have_content('Event successfuly created!')
      end
    end
  end

  context 'Event Invitation' do
    describe 'Inviting a another user to the created event' do
      it 'it successfully creates an event' do
        event.creator = creator
        visit root_path
        click_on 'Login'
        fill_in 'user_username', with: creator.username
        click_button 'Log in'
        click_link 'Create Event'
        fill_in 'event_description', with: event.description
        fill_in 'event_event_date', with: event.event_date
        click_button 'Create Event'
        fill_in 'username', with: invitee.username
        click_button 'Invite'
        expect(page).to have_content(invitee.username + ' successfuly invited!')
      end
      it 'returns an error with a non existant user' do
        event.creator = creator
        visit root_path
        click_on 'Login'
        fill_in 'user_username', with: creator.username
        click_button 'Log in'
        click_link 'Create Event'
        fill_in 'event_description', with: event.description
        fill_in 'event_event_date', with: event.event_date
        click_button 'Create Event'
        fill_in 'username', with: 'sonibil'
        click_button 'Invite'
        expect(page).to have_content('No such user exits')
      end
    end
  end
end
