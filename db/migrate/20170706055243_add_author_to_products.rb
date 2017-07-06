class AddAuthorToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :author
    add_foreign_key :products, :users, column: :author_id
  end
end
