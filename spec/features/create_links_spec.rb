require_relative '../spec_helper'

feature 'Add links' do
  scenario 'a user can add and store links' do
    visit('links/new')
    fill_in('title', with: 'test')
    fill_in('url', with: 'www.test.com')
    click_button("Submit")
    expect(page).to have_content('test')
    expect(page).to have_content('www.test.com')
  end
end
