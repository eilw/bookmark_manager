feature 'User Signup' do
  scenario 'A User is able to signup' do
    visit('/user/new')
    fill_in('name', with: 'Alex')
    fill_in('email', with: 'alex@xela.com')
    fill_in('password', with: '123456')
    click_button('Register')
    expect(page).to have_content("Welcome Alex")
    expect(User.all.count).to eq 1
    expect(User.first.email).to eq 'alex@xela.com'
  end
end
