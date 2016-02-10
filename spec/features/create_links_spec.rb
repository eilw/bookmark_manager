feature 'Add links' do
  scenario 'a user can add and store links' do
    visit('links/new')
    fill_in('title', with: 'test')
    fill_in('url', with: 'www.test.com')
    click_button("Submit")
    expect(page).to have_content('test')
    expect(page).to have_content('www.test.com')
  end

  scenario 'a user can add a link with a tag' do
    visit('links/new')
    fill_in('title', with: 'test')
    fill_in('url', with: 'www.test.com')
    fill_in('tag', with: 'cool')
    click_button("Submit")
    expect(page).to have_content('test')
    expect(page).to have_content('www.test.com')
    expect(page).to have_content('cool')
  end

  scenario 'a user can add multiple tags in a link' do
    visit('links/new')
    fill_in('title', with: 'test')
    fill_in('url', with: 'www.test.com')
    fill_in('tag', with: 'cool,it,fun')
    click_button("Submit")
    expect(page).to have_content('test')
    expect(page).to have_content('www.test.com')
    expect(page).to have_content('cool it fun')
  end
end
