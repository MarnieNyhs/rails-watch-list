# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'

Movie.destroy_all

puts 'Creating movies...'

10.times do
  Movie.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    overview: Faker::Lorem.paragraph,
    poster_url: "https://source.unsplash.com/random/2345×3518",
    rating: Faker::Number.within(range: 0.0..10.0),
  )
end
