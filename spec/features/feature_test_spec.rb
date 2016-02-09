require_relative "../spec_helper"

feature 'viewing links' do
  scenario 'when a user visits the homepage it displays links' do
    Link.create(:title => "title", :url => "url")
    visit('/links')
    expect(page).to have_content("title")
  end
end
