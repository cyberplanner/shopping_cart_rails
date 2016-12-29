def log_in
  user = create(:user)
  click_link 'Sign in'
  fill_in 'Email', with: 'foo@bar.com'
  fill_in 'Password', with: '123456789'
  click_button 'Log in'
end
