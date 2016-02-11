feature 'signing up for a user account ' do
  before{
    visit('/signup')
    fill_in('name', with: 'Eirik Wiig')
    fill_in('email', with: 'test_email@gmail.com')
    fill_in('password', with: 'weak')
    fill_in('password_confirmation', with: 'weak')
    click_button('Submit')
  }

  scenario ' I can sign up as a new user' do
    expect{User.create(name: 'Second user', email: 'second_user@email.com', password: 'weak2', password_confirmation: 'weak2')}.to change{User.count}.by(1)
    expect(page).to have_content('Welcome, Eirik Wiig')
    expect(User.first.email).to eq('test_email@gmail.com')
  end
end

feature 'signing up with a password confirmation' do
  scenario 'no new user is created if passwords do not match' do
    expect{sign_up(password_confirmation:'wrong')}.not_to change(User, :count)
  end
end
