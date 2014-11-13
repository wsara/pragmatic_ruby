require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'

module GameTurn
	def self.roll_die
		rand(1..6)
	end

	def self.take_turn(player)
		number_rolled = roll_die
		case number_rolled
		when 5..6
			player.cuddle
		when 3..4
			puts "#{player.name} was skipped."
		else
			player.poke
		end
		
		treasure = TreasureTrove.random
		player.found_treasure(treasure)
	end
end
