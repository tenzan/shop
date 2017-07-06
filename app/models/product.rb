class Product < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
