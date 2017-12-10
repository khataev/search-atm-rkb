# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b11 = ['Фестивальная 11', 55.855694, 37.475237] # Фестивальная 11
b7 = ['Фестивальная 7', 55.855429, 37.474357] # Фестивальная 7
b5 = ['Фестивальная 5', 55.855199, 37.473477] # Фестивальная 5
b3 = ['Фестивальная 3', 55.854982, 37.472533] # Фестивальная 3
b1 = ['Фестивальная 1', 55.854753, 37.471610] # Фестивальная 1
b7a = ['Фестивальная 7A', 55.855803, 37.473778] # Фестивальная 7A

[b11,b7,b5,b3,b1,b7a].each { |a| Atm.create name: a[0], lat: a[1], lon: a[2] }
