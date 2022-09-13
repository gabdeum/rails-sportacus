# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning DB..."
puts ">> Cleaning Surfboards"
Surfboard.destroy_all
puts ">> Cleaning Users"
User.destroy_all

puts "\r\nSeeding DB..."
puts ">> Creating users"
User.create(email: 'gabriel.demange@gmail.com', password: '123456789', first_name: 'Gabriel', last_name: 'Demange', address: '125 rue lamarck, Paris')
User.create(email: 'gabriel.demange.com@gmail.com', password: '123456789', first_name: 'Gabriel', last_name: 'Demange', address: '125 rue lamarck, Paris')
User.create(email: 'tom.ecrepont@gmail.com', password: '123456789', first_name: 'Tom', last_name: 'Ecrepont', address: '2 rue du caillon, Paris')
User.create(email: 'eva.gochtovtt@gmail.com', password: '123456789', first_name: 'Eva', last_name: 'Demange', address: '125 rue lamarck, Paris')
User.create(email: 'swan.dasilva@gmail.com', password: '123456789', first_name: 'Swan', last_name: 'Da Silva', address: '25 rue Simplon, Paris')

puts ">> Creating articles"
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[0]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[0]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[1]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[1]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[2]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[2]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[3]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[4]
surfboard.save!
surfboard.create_characteristic(length: "5'10", volume: 45, shape: 0)
