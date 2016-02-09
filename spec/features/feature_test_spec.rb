require_relative "../spec_helper"

feature 'viewing links' do
  scenario 'when a user visits the homepage it displays links' do
    Link.create(:title => "My Site", :url => "alex.avlonitis.me")
    visit('/links')
    expect(page).to have_content("My Site")
    expect(page).to have_content("alex.avlonitis.me")
  end
end
