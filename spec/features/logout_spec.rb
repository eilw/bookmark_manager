feature 'Logout' do
  scenario 'When a user logs out a goodbye message is displayed' do
    signup
    login
    click_button('logout')
    expect(current_path).to eq('/links')
    expect(page).to have_content('Goodbye Alex')
  end
end
