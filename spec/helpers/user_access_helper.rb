def sign_up(email:"deadpool@marvel.com",password:"whatever")
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password, :match => :prefer_exact
  fill_in 'Password confirmation', with: password, :match => :prefer_exact
  click_button 'Sign up'
end

def sign_in(email: 'deadpool@marvel.com',password:'whatever')
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end

def sign_out
 click_link 'Sign out'
end
