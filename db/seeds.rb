# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: "admin@example.com")
  User.create!(email: "admin@example.com", password: "password", admin: true)
end

unless User.exists?(email: "guest@example.com")
  User.create!(email: "guest@example.com", password: "password")
end

["Books", "Magazines"].each do |name|
  unless Category.exists?(name: name)
    Category.create!(name: name)
  end
end
