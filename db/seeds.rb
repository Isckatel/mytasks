# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Category.create({name: "Food"})
c2 = Category.create({name: "Drink"})

c1.products.create({name: "Bread", price: 1.5})
c1.products.create({name: "Butter",price: 2.6})
c1.products.create({name: "Pomodoro",price: 3.7})
c1.products.create({name: "Onion",price: 4.82})
c1.products.create({name: "Carrot",price: 5.99})
c2.products.create({name: "Milk", price: 3.28})
c2.products.create({name: "Water",price: 1.49})
c2.products.create({name: "Dushes",price: 1.00})