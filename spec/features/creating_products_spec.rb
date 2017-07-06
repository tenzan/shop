feature 'Users can create new products' do
  let(:user) { FactoryGirl.create(:user) }
  before do
    login_as(user)
    category = FactoryGirl.create(:category, name: 'Books')

    visit category_path(category)
    click_link 'New Product'
  end

  scenario 'with valid attributes' do
    path =  "#{Rails.root}/spec/fixtures/images/sample_image_01.png"

    fill_in 'Name', with: 'Sample title'
    fill_in 'Description', with: 'Some description'
    fill_in 'Price', with: 23.00
    attach_file 'Image', path
    click_button 'Create Product'

    expect(page).to have_content 'Product has been created.'
    within("#product") do
      expect(page).to have_content "Author: #{user.email}"
    end
  end
  scenario 'with invalid attributes' do
    click_button 'Create Product'

    expect(page).to have_content 'Product has not been created.'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Price can't be blank"
    expect(page).to have_content "Image can't be blank"
  end
end
