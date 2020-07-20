require 'rails_helper'

RSpec.describe 'authentication', type: :feature do
  let(:user) { create(:user) }
  describe 'with valid credential' do
    it 'it successfully loads the user page' do
      visit '/'
      click_on 'Login'
      fill_in 'user_username', with: user.username
      click_button 'Log in'
      expect(page).to have_content('Successfuly Logged in!')
    end
  end
end
