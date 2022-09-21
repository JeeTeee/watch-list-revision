require "open-uri"

puts "Cleaning db..."
User.destroy_all
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all



url = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)['results']

puts "Creating user..."

User.create!(email: "guillaume@test.com", password: "123456")

puts "Creating lists..."

file = URI.open("https://cdn.flickeringmyth.com/wp-content/uploads/2022/07/essential-80s-action.jpg")
list = List.new(name: "Action")
list.photo.attach(io: file, filename: "action.jpg", content_type: "image/jpg")
list.save!

file = URI.open("https://actuanewsmedia.files.wordpress.com/2021/03/top-10-rocky-movie-fight-scenes-kung-fu-kingdom-770x472_orig.jpg?w=1024")
list = List.new(name: "Bagarre")
list.photo.attach(io: file, filename: "action.jpg", content_type: "image/jpg")
list.save!

file = URI.open("https://www.eklecty-city.fr/wp-content/uploads/2020/10/american-pie-presents-girls-rules-movie-picture-01.jpg")
list = List.new(name: "Boules")
list.photo.attach(io: file, filename: "action.jpg", content_type: "image/jpg")
list.save!

puts "Creating movies..."

movies.each do |movie|
  Movie.create!( title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'] )
end

puts "Done !"
