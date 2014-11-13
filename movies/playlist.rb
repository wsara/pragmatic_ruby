require_relative 'movie'
require_relative 'waldorf_and_statler'
require_relative 'snack_bar'

class Playlist
	def initialize(name)
		@name = name.capitalize
		@movies = []
	end

	def load(from_file)
		File.readlines(from_file).each do |line|
			add_movie(Movie.from_csv(line))
		end
	end

	def save(to_file="movie_rankings.csv")
		File.open(to_file, "w") do |file|
			@movies.sort.each do |movie|
				file.puts movie.to_csv
			end
		end
	end


	def add_movie(movie)
		@movies << movie
	end

	def to_s
		"#{@name}'s playlist contains #{@movies.size} movies."
	end

	def play(viewings)
		puts "#{@name}'s playlist:"

		puts @movies.sort

		snacks = SnackBar::SNACKS
		puts "\nThere are #{snacks.size} snacks available in the snack bar:"
		snacks.each do |snack|
			puts "#{snack.name} has #{snack.carbs} carbs"
		end

		1.upto(viewings) do |count|
			puts "\nViewing #{count}:"
			@movies.each do |movie|
				WaldorfAndStatler.review(movie)
				snack = SnackBar.random
				movie.ate_snack(snack)
				puts movie	
			end
		end
	end

	def total_carbs_consumed
		#we pass the 0 parameter to reduce in case the movies array is empty
		#the block takes the accumulator (sum) and the object (movie)
		#we have to iterate through the movies array like this because we don't have an array of movies.carbs_consumed sitting around already
		@movies.reduce(0) do |sum, movie|
			sum + movie.carbs_consumed
		end
	end

	def print_stats
		puts "\n#{@name}'s Stats:"
		
		puts "#{total_carbs_consumed} total carbs consumed"

		@movies.sort.each do |movie|
			puts "\n#{movie.title}'s snack totals:"
			movie.each_snack do |snack|
				puts "#{snack.carbs} total #{snack.name} carbs"
			end
			puts "#{movie.carbs_consumed} grand total carbs"
		end

		hits, flops = @movies.partition { |movie| movie.hit? }
		puts "\nHits:"
		puts hits.sort

		puts "\nFlops:"
		puts flops.sort
	end
end

if __FILE__ == $0
	movie1 = Movie.new("ghostbusters", 10)
	playlist1 = Playlist.new("sara")
	playlist1.add_movie(movie1)
	playlist1.play(3)
	puts playlist1
end
