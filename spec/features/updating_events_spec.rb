require 'rails_helper'

feature 'Events' do
  background do
    event = create(:event, title: "John's Birthday", date: "15-5-2017")
    event = create(:event, title: "Jane's Birthday", date: "16-6-2017")
  end
  scenario 'user can edit an event' do
    sign_up
    create_event
    visit("/")
    click_link "Graduation"
    click_link "Edit Graduation"
    fill_in 'Title', with: "MaryPoppin's"
    select('2017', :from => 'event_date_1i')
    select('December', :from => 'event_date_2i')
    select('31', :from => 'event_date_3i')
    click_button('Update Event')
    expect(page).to have_content("MaryPoppin's")
  end

end
