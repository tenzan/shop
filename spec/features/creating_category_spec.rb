feature 'Users can create categories' do
  before do
    visit '/'

    click_link 'New Category'
  end
  scenario 'with valid attributes' do

    fill_in 'Name', with: 'Books'
    click_button 'Create Category'

    expect(page).to have_content 'Category has been created.'
  end
  scenario 'when providing invalid attributes' do
    click_button 'Create Category'

    expect(page).to have_content 'Category has not been created.'
    expect(page).to have_content "Name can't be blank"
  end
end
