
feature 'Viewing links' do

  scenario 'Viewing a link on the page' do

    Link.create(url: 'http://www.google.com', name: 'Google')
    visit('/links')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Google')
    end

  end

end
