def signup(name: "Alex", email: "alex@xela.com", password: "123456", password_confirmation: "123456")
  visit('/users')
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Register')
end

def login(email: "alex@xela.com", password: "123456")
  visit('/users/login')
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Login')
end
