feature 'Users can edit existing categories' do
  before do
    FactoryGirl.create(:category, name: 'Books')

    visit '/'
    click_link 'Books'
    click_link 'Edit Category'
  end
  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Books 2'
    click_button 'Update Category'
    expect(page).to have_content 'Category has been updated.'
    expect(page).to have_content 'Books 2'
  end
  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Category'

    expect(page).to have_content 'Category has not been updated.'
  end
end
