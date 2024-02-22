# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = {name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: "chinese"}
pizza_east =  {name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "italian"}
le_gazette =  {name: "Gazette", address: "218 Trinity Rd, London SW17 7HP", category: "french"}
three_uncles = {name: "Three Uncles", address: "2nd Floor, Hawley Wharf, Water Ln., London NW1 8AA", category:"chinese"}
five_guys = {name: "Five Guys", address: "186-190 Bishopsgate, London EC2M 4NR", category:"belgian"}

[dishoom, pizza_east, le_gazette, three_uncles, five_guys].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
