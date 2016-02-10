feature 'signing up for a user account ' do
  before{
    visit('/signup')
    fill_in('name', with: 'Eirik Wiig')
    fill_in('email', with: 'test_email@gmail.com')
    fill_in('password', with: 'weak')
    click_button('Submit')
  }

  scenario ' I can sign up as a new user' do
    expect{User.create(name: 'Second user', email: 'second_user@email.com', password: 'weak2')}.to change{User.count}.by(1)
    expect(page).to have_content('Welcome, Eirik Wiig')
    expect(User.first.email).to eq('test_email@gmail.com')
  end

  # scenario 'user sees a welcome message when they join' do
  #   expect(page).to have_content('Welcome Eirik Wiig')
  # end
  #
  # scenario 'the database stores the users email address' do
  #   expect(User.first.email).to eq('test_email@gmail.com')
  # end
  #
  # scenario 'the user count increases by 1 when a user signs up' do
  #   expect{User.create(name: 'Second user', email: 'second_user@email.com', password: 'weak2')}.to change{User.count}.by(1)
  # end


end
