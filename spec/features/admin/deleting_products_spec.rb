feature 'Users can delete products' do
  let(:author)  { FactoryGirl.create(:user, :admin) }
  let(:category) {FactoryGirl.create(:category)}
  let(:product) {FactoryGirl.create(:product, category: category, author: author)}

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit category_product_path(category, product)
  end

  scenario 'successfully' do
    click_link 'Delete Product'

    expect(page).to have_content 'Product has been deleted.'
    expect(page.current_url).to eq category_url(category)
  end
end
