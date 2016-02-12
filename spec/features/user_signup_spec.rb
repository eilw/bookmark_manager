feature 'User Signup' do

  scenario 'A User is able to signup' do
    signup
    expect(page).to have_content("Welcome Alex")
    expect(User.all.count).to eq 1
    expect(User.first.email).to eq 'alex@xela.com'
  end

  scenario 'A user is not created if he puts wrong password twice' do
    signup(password_confirmation: '123ssf')
    expect(User.all).to be_empty
  end

  scenario 'An error message is diplayed if wrong password twice' do
    signup(password_confirmation: '123ssf')
    error = "Password does not match the confirmation User Registration"
    expect(page).to have_content(error)
  end

  scenario 'A user can\'t signup if he doesn\'t provide an email' do
    signup(email: "")
    expect(User.all).to be_empty
  end

  scenario 'A user can\'t sign up if the email already exists' do
    signup
    signup
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end
end
