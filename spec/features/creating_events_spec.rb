require 'rails_helper'

feature 'Events' do
  background do
    event = create(:event, title: "John's Birthday", date: "15/5/2017")
    event = create(:event, title: "Jane's Birthday", date: "16/6/2017")
  end
  scenario 'user can view events' do
    visit '/'
    expect(page).to have_content "John's Birthday"
    expect(page).to have_content "Jane's Birthday"
  end
end
