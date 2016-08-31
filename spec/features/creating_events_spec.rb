require 'rails_helper'

feature 'Events' do
  background do
    event = create(:event, title: "John's Birthday", date: "15-5-2017")
    event = create(:event, title: "Jane's Birthday", date: "16-6-2017")
    sign_up
    click_link('New Event')
    select('2017', :from => 'event_date_1i')
    select('December', :from => 'event_date_2i')
    select('31', :from => 'event_date_3i')
  end

  scenario 'user can create events and get confirmation' do

    fill_in 'Title', with: 'Graduation'
    click_button('Create Event')
    expect(page).to have_content 'Graduation'
    expect(page).to have_content '2017-12-31'
    expect(page).to have_content 'Successfully created the event'
  end

  scenario 'user cannot create events without title' do

    click_button('Create Event')
    expect(page).not_to have_content ('2017-12-31')
    expect(page).to have_content("Something went wrong")
    expect(current_path).to eq '/events'
  end
end
