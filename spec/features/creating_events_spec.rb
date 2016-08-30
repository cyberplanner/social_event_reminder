require 'rails_helper'

feature 'Events' do
  background do
    event = create(:event, title: "John's Birthday", date: "15-5-2017")
    event = create(:event, title: "Jane's Birthday", date: "16-6-2017")
  end
  scenario 'user can view events' do
    visit '/'
    expect(page).to have_content "John's Birthday"
    expect(page).to have_content "Jane's Birthday"
  end

  scenario 'user can create events' do
    visit '/'
    click_link('New Event')
    fill_in 'Title', with: 'Graduation'
    select '2017', :from => 'date'
    select '12', :from => 'date'
    select '31', :from => 'date'
    # select('2017/12/31', :from => 'Date')
    click_button('Create Event')
    expect(page).to have_content 'Graduation'
    expect(page).to have_content '2017-12-31'
  end
end
