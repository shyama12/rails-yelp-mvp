# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Seeding restaurants'

Restaurant.destroy_all
categories = %w[chinese italian japanese french belgian]

10.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name,
                                 address: Faker::Address.street_address,
                                 phone_number: Faker::PhoneNumber.phone_number_with_country_code,
                                 category: categories.sample)

  puts 'Creating reviews'
  reviews_count = rand(0..4)
  reviews_count.times do
    review = Review.create(rating: rand(0..5), content: Faker::Restaurant.review, restaurant: restaurant)
    puts "Created review with id #{review.id}"
  end

  puts 'Finished creating reviews'
  puts "Created restaurant with id #{restaurant.id}"
end

puts 'Finished creating restaurants'
