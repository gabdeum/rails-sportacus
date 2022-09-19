require "open-uri"

puts "Cleaning DB..."
puts ">> Cleaning Surfboards"
Surfboard.all.each do |surfboard|
  surfboard.pictures.purge
  surfboard.destroy
end
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
surfboard.pictures.attach(filename: "surfboard1.png", io: URI.open("https://images.pexels.com/photos/757133/pexels-photo-757133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[0]
surfboard.pictures.attach(filename: "surfboard2.png", io: URI.open("https://images.pexels.com/photos/1667018/pexels-photo-1667018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[1]
surfboard.pictures.attach(filename: "surfboard3.png", io: URI.open("https://images.pexels.com/photos/1753689/pexels-photo-1753689.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[1]
surfboard.pictures.attach(filename: "surfboard4.png", io: URI.open("https://images.pexels.com/photos/5694133/pexels-photo-5694133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[2]
surfboard.pictures.attach(filename: "surfboard5.png", io: URI.open("https://images.pexels.com/photos/1394264/pexels-photo-1394264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[2]
surfboard.pictures.attach(filename: "surfboard6.png", io: URI.open("https://images.pexels.com/photos/785133/pexels-photo-785133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[3]
surfboard.pictures.attach(filename: "surfboard7.png", io: URI.open("https://images.pexels.com/photos/699955/pexels-photo-699955.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
surfboard = Surfboard.new(title: 'Nice surboard', description: 'This is a nice surfboard', address: '125 rue lamarck', brand: 'Olaian', daily_rate: 120, minimum_rent_days: 3, conditions: 0)
surfboard.user = User.all[4]
surfboard.pictures.attach(filename: "surfboard8.png", io: URI.open("https://images.pexels.com/photos/9269283/pexels-photo-9269283.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), content_type: "image/png")
surfboard.save!
surfboard.create_characteristic(foot: 5, inch: 10, volume: 45, shape: 0)
