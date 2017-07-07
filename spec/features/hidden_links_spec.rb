feature 'Users can see only appropriate links' do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:category) { FactoryGirl.create(:category) }

  context "anonymous users" do
    scenario "cannot see the New Category link" do
      visit "/"
      expect(page).not_to have_link "New Category"
    end
    scenario "cannot see the Delete Category and New Product links" do
      visit category_path(category)
      expect(page).not_to have_link "Delete Category"
      expect(page).not_to have_link "New Product"
    end
  end

  context "regular users" do
    before { login_as(user) }
    scenario "cannot see the New Category link" do
      visit "/"
      expect(page).not_to have_link "New Category"
    end
    scenario "cannot see the Delete Category and New Product links" do
      visit category_path(category)
      expect(page).not_to have_link "Delete Category"
      expect(page).not_to have_link "New Product"
    end
  end

  context "admin users" do
    before { login_as(admin) }
    scenario "can see the New Category link" do
      visit "/"
      expect(page).to have_link "New Category"
    end
    scenario "can see the Delete Category and New Product links" do
      visit category_path(category)
      expect(page).to have_link "Delete Category"
      expect(page).to have_link "New Product"
    end
  end
end
