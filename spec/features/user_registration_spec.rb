feature 'signing up for a user account ' do

  scenario ' I can sign up as a new user' do
    sign_up
    expect{User.create(name: 'Second user', email: 'second_user@email.com', password: 'weak2', password_confirmation: 'weak2')}.to change{User.count}.by(1)
    expect(page).to have_content('Welcome, Eirik Wiig')
    expect(User.first.email).to eq('test_email@gmail.com')
  end
end

feature 'signing up with a password confirmation' do
  scenario 'no new user is created if passwords do not match' do
    expect{sign_up(password_confirmation:'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/signup'
    expect(find_field('name').value).to eq 'Eirik Wiig'
    expect(find_field('email').value).to eq 'test_email@gmail.com'
  end
end

feature 'preventing incorrect signups' do
  scenario 'cannot sign up with a blank email' do
    sign_up(email: '')
    expect(current_path).to eq '/signup'
  end

  scenario 'cannot sign up with an email with a wrong format' do
    sign_up(email: 'wrong_format')
    expect(current_path).to eq '/signup'
  end

  scenario 'cannot sign up with an email with a wrong format' do
    sign_up(email: 'test_email@gmail.com')
    sign_up(email: 'test_email@gmail.com')
    expect(current_path).to eq '/signup'
    expect(page).to have_content('User already exists')
  end
end
