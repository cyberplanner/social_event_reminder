def sign_up(email:"deadpool@marvel.com",password:"whatever", username: "AmazingMe")
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password, :match => :prefer_exact
  fill_in 'Password confirmation', with: password, :match => :prefer_exact
  click_button 'Sign up'
end

def sign_in(email: 'deadpool@marvel.com',password:'whatever', username: "AmazingMe")
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end

def sign_out
 click_link 'Sign out'
end

def create_event
  click_link('New Event')
  fill_in 'Title', with: 'Graduation'
  select('2017', :from => 'event_date_1i')
  select('December', :from => 'event_date_2i')
  select('31', :from => 'event_date_3i')
  click_button 'Create Event'
end
