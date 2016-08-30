require 'rails_helper'

feature 'viewing the events' do
  scenario 'user is able to see a welcome page' do
    visit('/')
    expect(page).to have_content('FamilyConnect')
    expect(page).to have_link('New Event')
  end
end
