require "open-uri"

puts "Cleaning db..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all


url = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)['results']

puts "Creating lists..."

  List.create!(name: "Action")
  List.create!(name: "Bagare")
  List.create!(name: "Boule")


puts "Creating movies..."

movies.each do |movie|
  Movie.create!( title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'] )
end

puts "Done !"
