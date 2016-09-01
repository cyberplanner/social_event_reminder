require 'rails_helper'

feature 'viewing all event reminders' do
  scenario 'user can view all reminders related to the event' do
    sign_up
    create_event
    click_link 'Create a reminder'
    fill_in 'Name', with: 'my bro'
    fill_in 'Phone number', with: '3389764453'
    select('2017', :from => 'reminder_time_1i')
    select('December', :from => 'reminder_time_2i')
    select('31', :from => 'reminder_time_3i')
    select('10', :from => 'reminder_time_4i')
    select('10', :from => 'reminder_time_5i')
    click_button 'Create Reminder'
    expect(current_path).to eq event_reminders_path
  end
end
