
feature 'Adding tags' do

  scenario 'adding a tag to a link' do

    visit ('/links/new')
    fill_in('name',with: 'Apple')
    fill_in('url', with: 'www.apple.com')
    fill_in('tags', with: 'search')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Search')

  end

  scenario 'adding multiple tags to a link' do
    visit ('/links/new')
    fill_in('name',with: 'Apple')
    fill_in('url', with: 'www.apple.com')
    fill_in('tags', with: 'search phones company iphone steve-jobs')
    click_button('Submit')
    expect(page).to have_content ('Search, Phones, Company, Iphone')
  end

end
