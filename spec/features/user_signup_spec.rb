feature 'User Signup' do
  before (:each) do
    visit('/users')
    fill_in('name', with: 'Alex')
    fill_in('email', with: 'alex@xela.com')
    fill_in('password', with: '123456')
  end

  scenario 'A User is able to signup' do
    fill_in('password_confirmation', with: '123456')
    click_button('Register')
    expect(page).to have_content("Welcome Alex")
    expect(User.all.count).to eq 1
    expect(User.first.email).to eq 'alex@xela.com'
  end

  scenario 'A user is not created if he puts wrong password twice' do
    fill_in('password_confirmation', with: '15342')
    click_button('Register')
    expect(User.all).to be_empty
  end

  scenario 'An error message is diplayed if wrong password twice' do
    fill_in('password_confirmation', with: '15342')
    click_button('Register')
    expect(page).to have_content("Error: Wrong details")
  end

  scenario 'A user can\'t signup if he doesn\'t provide an email' do
    visit('/users')
    fill_in('name', with: 'Alex')
    fill_in('password', with: '123456')
    fill_in('password_confirmation', with: '123456')
    click_button('Register')
    expect(User.all).to be_empty
  end
end
