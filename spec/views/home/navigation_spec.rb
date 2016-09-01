require 'rails_helper'

feature 'Navbar' do
  scenario 'user can navigate to the root from anywhere' do
    visit '/'
    click_link 'Home'
    expect(page.current_path).to eq '/'
  end
end
