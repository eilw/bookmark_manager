feature 'signing up for a user account ' do

  scenario ' I can sign up as a new user' do
    correct_sign_up
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
    visit('/signup')
    fill_in('name', with: 'Eirik Wiig')
    fill_in('email', with: '')
    fill_in('password', with: 'weak')
    fill_in('password_confirmation', with: 'weak')
    click_button('Submit')
    expect(current_path).to eq '/signup'
  end

  scenario 'cannot sign up with an email with a wrong format' do
    visit('/signup')
    fill_in('name', with: 'Eirik Wiig')
    fill_in('email', with: 'wrong_format')
    fill_in('password', with: 'weak')
    fill_in('password_confirmation', with: 'weak')
    click_button('Submit')
    expect(current_path).to eq '/signup'
  end
end
