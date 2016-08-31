require 'rails_helper'

feature 'Events' do
  background do
    event = create(:event, title: "John's Birthday", date: "15-5-2017")
    event = create(:event, title: "Jane's Birthday", date: "16-6-2017")
    sign_up
  end
  scenario 'user can delete an event' do
    visit '/'
    click_link "John's Birthday"
    click_link "Delete John's Birthday"
    expect(page).to have_content("Successfully deleted the event")
    expect(current_path).to eq '/'
    expect(page).not_to have_content("John's Birthday")
  end
end
