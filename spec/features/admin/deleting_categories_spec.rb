feature 'Users can delete cateories' do
  before do
    login_as(FactoryGirl.create(:user, :admin))
  end
  scenario 'successfuly' do
    FactoryGirl.create(:category, name: 'Books')

    visit '/'
    click_link 'Books'
    click_link 'Delete Category'

    expect(page).to have_content 'Category has been deleted.'
    expect(page.current_url).to eq categories_url
    expect(page).to have_no_content 'Books'
  end
end
