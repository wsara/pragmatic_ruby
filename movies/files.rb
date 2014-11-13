require_relative 'movie'

# File.readlines("movies.csv").each do |line|
# 	title, rank = line.split(',')
# 	movie = Movie.new(title, rank.to_i)
# 	puts movie
# end

movie1 = Movie.new("Anaconda", 3)
movie2 = Movie.new("Pokemon", 10)

movies = [movie1, movie2]

