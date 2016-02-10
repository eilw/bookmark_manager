feature 'filter links' do
  scenario 'filter links based on tags' do
    visit('/links/new')
    fill_in('title', with: 'test')
    fill_in('url', with: 'www.test.com')
    fill_in('tag', with: 'bubbles')
    click_button("Submit")
    visit('/links/new')
    fill_in('title', with: 'test')
    fill_in('url', with: 'www.test.com')
    fill_in('tag', with: 'cool')
    click_button("Submit")
    visit('/tags/bubbles')
    expect(page).to have_content('test')
    expect(page).to have_content('www.test.com')
    fill_in('tag', with: 'bubbles')
  end
end
