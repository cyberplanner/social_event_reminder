require 'rails_helper'

feature 'Navbar' do
  scenario 'user can navigate to the root from anywhere' do
    visit '/'
    click_link 'Home'
    expect(page.current_path).to eq '/'
  end

  scenario "new users can't see event on homepage" do
    sign_up
    create_event
    sign_out
    click_link 'Home'
    expect(page).not_to have_content 'Graduation'
  end
end
