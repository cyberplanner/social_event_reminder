require 'rails_helper'

feature 'Sign up' do
  scenario 'user can create an account' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: "deadpool@marvel.com"
    fill_in 'Password', with: "SuperSecret7"
    fill_in 'Password confirmation', with: "SuperSecret7"
    click_button 'Sign up'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'Welcome! you have signed up successfully.'
  end
end
