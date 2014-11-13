require_relative 'treasure_trove'

class Player
	attr_accessor :name, :consent
	attr_reader :health

	def initialize(name, health=100, consent=false)
		#self.name = name
		@name = name.capitalize
		@health = health
		@consent = consent
		@found_treasures = Hash.new(0)
	end

	def each_found_treasure
		@found_treasures.each do |name, points|
			yield Treasure.new(name, points)
		end
	end

	def found_treasure(treasure)
		@found_treasures[treasure.name] += treasure.points
		puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
		puts "#{@name}'s treasures: #{@found_treasures}"
	end

	def points
		@found_treasures.values.reduce(0, :+)
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	#this sorts the players by score from high to low
	def <=>(other)
		other.score <=> score
	end

	def give_consent
		@consent = true
	end

	def revoke_consent
		@consent = false
	end

	def to_s
		"I'm #{@name} with a health of #{@health} and a score of #{score} and my consent value is #{@consent}."
	end

	def score
		@health + points
	end

	def poke
		if consent == true
			@health -= 10
			puts "#{@name} got poked! Their health is now #{@health} and their score is #{score}."
		else
			puts "You can't poke #{@name}--get consent first!"
		end
	end

	def strong?
		if @health > 100
			true
		else
			false
		end
	end

	def cuddle
		if consent == true
			@health += 15
			puts "#{@name} got cuddled! Their health is now #{@health} and their score is #{score}."
		else
			puts "You can't cuddle #{@name}--get consent first!"
		end
	end

	def aftercare
		if @health <= 0
			puts "#{@name} needs aftercare!"
			return true
		else
			puts "#{@name} is okay :)"
			return false
		end
	end
end

if __FILE__ == $0
	player = Player.new("silver", 100, true)
	puts player.name
	puts player.health
	player.cuddle
	puts player.health
	player.poke
	puts player.health
	player.name = "copper"
	puts player.name
end