

def sign_up(name: 'Eirik Wiig', email: 'test_email@gmail.com', password: 'weak', password_confirmation: 'weak')
  visit('/signup')
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Submit')
end


def log_in(email: 'test_email@gmail.com', password: 'weak')
  visit('/login')
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Submit')
end
