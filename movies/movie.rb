class Movie
	attr_reader :rank
	attr_accessor :title

	def initialize(title, rank=0)
		@title = title.capitalize
		@rank = rank
		@snack_carbs = Hash.new(0)
	end

	def self.from_csv(line)
		title, rank = line.split(',')
		Movie.new(title, Integer(rank))
	end

	def to_csv
		"#{@title},#{@rank}"
	end

	def normalized_rank
		@rank / 10
	end

	def ate_snack(snack)
		@snack_carbs[snack.name] += snack.carbs
		puts "#{@title} led to #{snack.carbs} #{snack.name} carbs being consumed."
		puts "#{@title}'s snacks: #{@snack_carbs}"
	end

	def carbs_consumed
		#0 is the initial value that we're passing in, in case the array is empty
		#.values returns an array of just the values
		@snack_carbs.values.reduce(0, :+)
	end

	def each_snack
		@snack_carbs.each do |name, carbs|
			snack = Snack.new(name, carbs)
			yield snack
		end
	end
	
	def to_s
		"#{@title} has a rank of #{@rank} (#{status})"
	end

	def thumbs_up
		@rank += 1
	end

	def thumbs_down
		@rank -= 1
	end

	def hit?
		@rank >= 10
	end

	def status
		hit? ? "Hit" : "Flop"
	end

	def <=>(other_movie)
		other_movie.rank <=> @rank
	end

end

if __FILE__ == $0
	movie = Movie.new("Jurassic Park", 10)
	puts movie.title
	puts movie.rank

	movie.thumbs_up
	movie.thumbs_down
	puts movie.rank
end