# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Dodavanje podataka u bazu
# product = Product.new()
# product.save

# ili - Product.create(name: 'Product1', price: 1, description: 'Test0')

#Product.create(name: 'Product1', price: 1, description: 'Test0')
#Product.create(name: 'Product2', price: 12, description: 'Test04')
#Product.create(name: 'Product3', price: 13, description: 'Test03')
#Product.create(name: 'Product4', price: 15, description: 'Test02')
#Product.create(name: 'Product5', price: 16, description: 'Test01')

100.times do |index|
    Product.create(name: "Product #{index}", price: 1, description: "Test #{index}")
    # index += 1
end