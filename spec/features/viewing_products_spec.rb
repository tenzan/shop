feature 'Users can view products' do
  before do
    path_01 =  File.join(Rails.root, "/spec/fixtures/images/sample_image_01.png")
    path_02 =  File.join(Rails.root, "/spec/fixtures/images/sample_image_02.png")

    author = FactoryGirl.create(:user)

    books = FactoryGirl.create(:category, name: 'Books')
    FactoryGirl.create(:product, category: books, author: author, name: 'Sample book title',
                       description: 'Some description for sample book',
                       price: 23.00, image: Rack::Test::UploadedFile.new(path_01))

     magazines = FactoryGirl.create(:category, name: 'Magazines')
     FactoryGirl.create(:product, category: magazines, author: author, name: 'Sample magazine title',
                        description: 'Some description for sample magazine',
                        price: 43.00, image: Rack::Test::UploadedFile.new(path_02))

     visit '/'
  end
  scenario 'for a given category' do
    click_link 'Books'

    expect(page).to have_content 'Sample book title'
    expect(page).to_not have_content 'Sample magazine title'

    click_link 'Sample book title'
    within("#product h2") do
      expect(page).to have_content 'Sample book title'
    end
    expect(page).to have_content "Sample book title"
  end
end
