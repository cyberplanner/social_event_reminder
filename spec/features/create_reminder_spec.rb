require 'rails_helper'

feature 'Reminders' do
  scenario 'user can create a reminder' do
    sign_up
    create_event
    visit '/'
    click_link 'Graduation'
    click_link 'Remind Me'
    fill_in 'Name', with: 'my bro'
    fill_in 'Phone number', with: '3389764453'
    select('2017', :from => 'reminder_date_1i')
    select('December', :from => 'reminder_date_2i')
    select('31', :from => 'reminder_date_3i')
    select('10', :from => 'reminder_time_1i')
    select('10', :from => 'reminder_time_2i')
    click_button 'Create Reminder'
    expect(page).to have_content('Reminder successfully created')
  end
end
