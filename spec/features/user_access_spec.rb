require 'rails_helper'

feature 'User access' do
  scenario 'user can create an account' do
    sign_up
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  context 'User Sign in/Sign out' do

    background do
      user = create(:user, email: 'email@email.com', password: "password1")
      visit '/'
      sign_up
    end

    scenario 'user can sign in' do
      sign_out
      sign_in
      expect(page).to have_content 'Signed in successfully'
    end

    scenario 'user can sign out if they are signed in' do
      sign_out
      expect(page).to have_content 'Signed out successfully'
      expect(page).not_to have_link('Sign out')
    end

    scenario 'user cannot see the new post link unless signed in' do
      sign_out
      expect(page).not_to have_link('New Event')
    end

  end
end
