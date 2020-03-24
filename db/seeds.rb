# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

def handle_string_io_as_file(io, filename)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

puts 'Destroying all users, investments, and properties...'
Investment.destroy_all
Property.destroy_all
User.destroy_all


sleep(2)
puts 'Creating new properties...'
sleep(2)

users = []

30.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
end
users.each do |user|
  property = Property.create!(
    user: user,
    name: Faker::Address.street_address,
    description: Faker::Address.community,
    location: Faker::Address.city)
  url = "https://source.unsplash.com/1024x768/?building,property"
  building = URI.open(url)
  property.photo.attach(io: handle_string_io_as_file(building, 'image.png'), filename: "Property #{user.id}", content_type: 'image/png')
end

puts 'Finished!'
