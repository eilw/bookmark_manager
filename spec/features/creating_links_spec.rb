feature 'User can add links' do
  scenario 'using a form to submit a new link' do
    visit ('/links/new')
    fill_in('name',with: 'Apple')
    fill_in('url', with: 'www.apple.com')
    click_button('Submit')
    expect(page).to have_content('Apple')
  end

end
