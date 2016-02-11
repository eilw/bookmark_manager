
feature 'user can sign in' do
  scenario 'user can sign in and sees a welcome screen' do
    sign_up
    log_in
    expect(page).to have_content('Welcome, Eirik Wiig')
  end
end
