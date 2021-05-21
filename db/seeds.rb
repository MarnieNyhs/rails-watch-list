# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'

puts 'Cleaning database...'

puts 'Creating movies...'

Movie.destroy_all
url = 'http://tmdb.lewagon.com/movie/top_rated'
10.times do |i|
  puts "Importing movie from page #{i + 1}"
  movies_serialized = URI.open("#{url}?page=#{i + 1}").read
  movies = JSON.parse(movies_serialized)['results']
  movies.each do |m|
    puts "creating#{m['title']}"
    Movie.create(title: m['title'],
                 overview: m['overview'],
                 poster_url: "https://image.tmdb.org/t/p/w500#{m['poster_path']}",
                 rating: m['vote_average'])
  end
end
