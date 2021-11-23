# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Title.create({title: "Семья"})
c2 = Title.create({title: "Работа"})

c1.tasks.create({text: "Купить молоко", isCompleted: false})
c1.tasks.create({text: "Забрать обувь из ремонта", isCompleted: false})
c2.tasks.create({text: "Заполнить отчет", isCompleted: true})
c2.tasks.create({text: "Позвонить заказчику", isCompleted: false})