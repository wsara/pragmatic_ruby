require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def save_high_scores(to_file="high_scores.txt")
  File.open(to_file, "w") do |file|
    file.puts "#{@title} High Scores:"
    file.puts "\n"
		@players.sort.each do |player|
			formatted_name = player.name.ljust(20, '.')
			file.puts "#{formatted_name} #{player.score}"
		end
  end
end

	def load_players(from_file)
		File.readlines(from_file).each do |line|
			name, health = line.split(',')
			player = Player.new(name, Integer(health))
			add_player(player)
		end
	end

	def add_player(player)
		@players << player
	end

	def play(rounds)
		puts "#{@title} is a game with the following players:"
		list_names

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"

		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points"
		end
		
		1.upto(rounds) do |count|
			puts "\nRound #{count}:"
			@players.each do |player|
				puts "\n"
				puts player
				GameTurn.take_turn(player)
			end
		end
	end

	def list_names
		@players.each do |player|
			puts player.name
		end
	end

	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end

	def print_stats
		strong_players = @players.select { |player| player.strong? }
		tired_players = @players.reject { |player| player.strong? }
		
		puts "\n#{@title} Statistics:"

		puts "\n#{strong_players.size} strong players:"

		strong_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{tired_players.size} tired players:"

		tired_players.each do |player|
			print_name_and_health(player)
		end

		@players.each do |player|
			puts "\n#{player.name}'s point totals:"
			player.each_found_treasure do |treasure|
				puts "#{treasure.points} total #{treasure.name} points"
			end
			puts "#{player.points} grand total points"
		end

		puts "\n#{total_points} total points from treasures found"
	end

	def high_scores
		puts "\n#{@title} High Scores:"
		puts "\n"
		#this sorts the player scores from high to low
		@players.sort.each do |player|
			formatted_name = player.name.ljust(20, '.')
			puts "#{formatted_name} #{player.score}"
		end
	end

	def total_points
		@players.reduce(0) { |sum, player| sum + player.points }
	end

	def to_s
		"Welcome to #{@title}. There are #{@players.size} players."
	end
end

if __FILE__ == $0
	game = Game.new("MegaDungeon")
	player = Player.new("christy", 100, true)
	player2 = Player.new("lola", 150)
	player3 = Player.new("bibi")
	game.add_player(player)
	game.add_player(player2)
	game.add_player(player3)
	
	game.play(1)
	game.print_stats
	game.high_scores
	
end