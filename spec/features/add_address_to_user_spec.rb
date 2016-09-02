require 'rails_helper'

feature 'Address' do
  scenario 'user can add an address to their profile' do
    sign_up
    click_link 'My Profile'
    click_link "Update Profile"
    click_link 'Update Address'
    fill_in 'Line one', with: '1 The Street'
    fill_in 'Line two', with: 'London'
    fill_in 'Postcode', with: 'ABC 123'
    click_button 'Create Address'
    expect(page).to have_content '1 The Street'
    expect(page).to have_content 'London'
    expect(page).to have_content 'ABC 123'
  end
end
