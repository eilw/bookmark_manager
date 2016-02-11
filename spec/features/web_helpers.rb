def correct_sign_up
  visit('/signup')
  fill_in('name', with: 'Eirik Wiig')
  fill_in('email', with: 'test_email@gmail.com')
  fill_in('password', with: 'weak')
  fill_in('password_confirmation', with: 'weak')
  click_button('Submit')
end

def sign_up(password)
  visit('/signup')
  fill_in('name', with: 'Eirik Wiig')
  fill_in('email', with: 'test_email@gmail.com')
  fill_in('password', with: 'weak')
  fill_in('password_confirmation', with: password)
  click_button('Submit')
end
