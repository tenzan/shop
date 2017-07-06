feature 'Users can edit existing products' do
  let(:category) {FactoryGirl.create(:category)}
  let(:product) {FactoryGirl.create(:product, category: category)}

  before do
    visit category_product_path(category, product)
    click_link 'Edit Product'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Updated name'
    click_button 'Update Product'

    expect(page).to have_content 'Product has been updated.'

    within("#product h2") do
      expect(page).to have_content 'Updated name'
      expect(page).not_to have_content product.name
    end
  end

  scenario 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Product'

    expect(page).to have_content 'Product has not been updated.'
  end
end
