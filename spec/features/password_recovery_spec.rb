feature 'Password recovery' do
  scenario 'A user can request for a password recovery' do
    signup
    click_button('logout')
    visit('/users/login')
    click_link('Forgot password')
    fill_in("email", with: 'alex@xela.com')
    expect(current_path).to eq '/users/reset-password'
    click_button("reset")
    expect(current_path).to eq '/users/login'
    expect(page).to have_content('Your password has been sent')
  end
end
