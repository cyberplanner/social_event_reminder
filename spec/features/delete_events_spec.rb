require 'rails_helper'

feature 'Events' do
  background do
    event = create(:event, title: "John's Birthday", date: "15-5-2017")
    event = create(:event, title: "Jane's Birthday", date: "16-6-2017")

    user1 = create(:user, email: "test@test.com", password: '123456', password_confirmation: '123456')
    user2 = create(:user, email: "test2@test.com", password: '123456', password_confirmation: '123456')

  end
  scenario 'user can delete an event' do
    visit("/")
    sign_up
    create_event
    click_link "Delete Graduation"
    expect(page).to have_content("Successfully deleted the event")
    expect(current_path).to eq '/'
    expect(page).not_to have_content("Graduation")
  end

  scenario 'only an owner can delete an event' do
    visit('/')
    sign_in(email: "test@test.com", password: '123456')
    click_link 'New Event'
    fill_in("Title", with: "Something important")
    select('2017', :from => 'event_date_1i')
    select('December', :from => 'event_date_2i')
    select('31', :from => 'event_date_3i')
    click_button "Create Event"
    sign_out
    sign_in(email: "test2@test.com", password: '123456')
    click_link('Something important')
    expect(page).not_to have_link("Delete Something important")
  end
end
