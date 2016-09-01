require 'rails_helper'

feature 'viewing all event reminders' do
  scenario 'after creating a reminder, user is taken to list of all reminders' do
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
    expect(page).to have_content('Reminders for Graduation')
    expect(page).to have_content('my bro')
    click_link 'Home'
    click_link 'Graduation'
    click_link 'Reminders'
    expect(page).to have_content('Reminders for Graduation')  

  end




end
