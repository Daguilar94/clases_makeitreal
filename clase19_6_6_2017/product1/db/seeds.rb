# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  {
    name: 'name1',
    price: 2000,
    quantity: 3
  },
  {
    name: 'name2',
    price: 3000,
    quantity: 5
  },
  {
    name: 'name3',
    price: 4000,
    quantity: 1
  },
  {
    name: 'name4',
    price: 5000,
    quantity: 2
  }
].each do |product|
  Product.create product
end
