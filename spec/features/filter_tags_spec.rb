feature 'can filter links by tag' do
  before{
    Link.create(url: 'www.apple.com', name: 'Apple', tags: [Tag.first_or_create(name: 'phones')])
    Link.create(url: 'www.water.com', name: 'Waterboy', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'www.Bubble-boy.com', name: 'Bubble-boy', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'www.google.com', name: 'Google', tags: [Tag.first_or_create(name: 'search')])
  }
  scenario 'checks that only links with tag is shown' do
    visit('tags/bubbles')
    expect(page).to have_content('water.com')
    expect(page).not_to have_content('apple.com')
    expect(page).to have_content('Bubble-boy.com')
  end

  scenario 'checks that only links with tag is shown' do
    visit('tags/phones')
    expect(page).not_to have_content('water.com')
    expect(page).to have_content('apple.com')
  end

  scenario 'adding a new link adds the count by 1' do
    expect{Link.create(url: 'www.apple.com', name: 'Apple', tags: [Tag.first_or_create(name: 'phones')])}.to change{Link.count}.by(1)
  end
end
