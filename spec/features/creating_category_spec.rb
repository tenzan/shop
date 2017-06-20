feature 'Users can create categories' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Category'

    fill_in 'Name', with: 'Books'
    click_button 'Create Category'

    expect(page).to have_content 'Category has been created.'
  end
end
