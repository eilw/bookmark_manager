feature 'User Signup' do
  scenario 'A User is able to signup' do
    fill_in('name', with: 'Alex')
    fill_in('last-name', with: 'Xela')
    fill_in('email', with: 'alex@xela.com')
    fill_in('password', with: '123456')
    click_button('Register')
    User.count(1)
  end
end
