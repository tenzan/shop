class Category < ApplicationRecord
  has_many :products, dependent: :delete_all

  validates :name, presence: true
end
