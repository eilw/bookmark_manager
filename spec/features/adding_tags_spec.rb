
feature 'Adding tags' do

  scenario 'adding a tag to a link' do

    visit ('/links/new')
    fill_in('name',with: 'Apple')
    fill_in('url', with: 'www.apple.com')
    fill_in('tag', with: 'search')
    click_button('Submit')
    expect(page).to have_content('search')

  end

end
