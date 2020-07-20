require 'rails_helper'

# create event
# invite attendees
# be able to see all events created
# be able to see all events one is invited to
# be able to see upcoming events in the upcoming category
# be able to see the past events in the past category
require 'rails_helper'

RSpec.describe 'Event management', type: :feature do
  let(:creator) { build(:user) }
  let(:event) { build(:event) }
  context 'Create event' do
    describe 'with valid input' do
      it 'it successfully creates an event' do
        event.creator = creator
        visit root_path
        click_on 'Login'
        fill_in 'user_username', with: creator.username
        click_button 'Log in'
        sleep(100)
        click_link 'Create Event'
        sleep(100)
        fill_in 'event_description', with: event.event_description
        fill_in 'event_event_date', with: event.event_date
        click_button 'Create Event'
        expect(page).to have_content('Event successfuly created!')
      end
    end
  end

  #   context 'Log out' do
  #     describe 'when the logout button is clicked' do
  #       it 'it successfully redirects to the root page' do
  #         visit root_path
  #         click_on 'Login'
  #         fill_in 'user_username', with: user.username
  #         click_button 'Log in'
  #         click_on 'Log out'
  #         expect(page).to have_content('You are successful logged out!')
  #       end
  #     end
  #   end
end
