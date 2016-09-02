require 'rails_helper'

feature 'Profile page' do
  scenario 'a signed up user can view their profile information' do
    sign_up
    click_link 'My Profile'
    expect(page).to have_content'Name: AmazingMe'
  end

  scenario 'a signed up user can edit their profile information' do
    sign_up
    click_link 'My Profile'
    click_link "Update Profile"
    fill_in 'Username', with: 'NewUserName'
    click_button 'Update User'
    click_link 'My Profile'
    expect(page).not_to have_content'Name: AmazingMe'
    expect(page).to have_content'Name: NewUserName'
  end
end
