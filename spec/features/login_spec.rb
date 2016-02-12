feature 'I can login' do
  scenario 'Login and see a welcome message' do
    signup
    login
    expect(current_path).to eq('/links')
    expect(page).to have_content('Welcome Alex')
  end

  scenario 'Login with incorrect password gives login screen again' do
    signup
    login(password: 'incorrect_password')
    expect(current_path).to eq('/users/login')
  end
end
