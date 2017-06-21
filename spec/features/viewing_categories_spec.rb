feature 'Users can view categories' do
  scenario 'with the category details' do
    category = FactoryGirl.create(:category, name: 'Books')

    visit '/'
    click_link 'Books'
    expect(page.current_url).to eq category_url(category)
  end
end
