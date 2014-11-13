require_relative 'player'
require_relative 'game'

player1 = Player.new("Abby", 100, true)
player2 = Player.new("Bregory", 100, true)
player3 = Player.new("Coral", 100, true)


game = Game.new("Interactive Play Party Adventure")

game.load_players(ARGV.shift || "players.csv")


loop do
	puts "\nHow many game rounds? ('quit' to exit)"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		game.play(answer.to_i)
	when 'quit', 'exit', 'q', 'e'
		game.print_stats
		break
	else
		puts "Please enter a number or 'quit'"
	end 
end

game.save_high_scores