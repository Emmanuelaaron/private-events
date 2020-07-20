require 'rails_helper'

RSpec.describe 'authentication', type: :feature do
  let(:user) { create(:user) }
  context 'Sign in' do
    describe 'with valid credential' do
      it 'it successfully loads the user page' do
        visit root_path
        click_on 'Login'
        fill_in 'user_username', with: user.username
        click_button 'Log in'
        expect(page).to have_content('Successfuly Logged in!')
      end
    end
  end

  context 'Log out' do
    describe 'when the logout button is clicked' do
      it 'it successfully redirects to the root page' do
        visit root_path
        click_on 'Login'
        fill_in 'user_username', with: user.username
        click_button 'Log in'
        click_on 'Log out'
        expect(page).to have_content('You are successful logged out!')
      end
    end
  end
end
