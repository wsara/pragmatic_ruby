require_relative 'game'

describe Game do

	before do
		@game = Game.new("Game1")
		@initial_health = 100
		@player = Player.new("margot", @initial_health, true)
		@game.add_player(@player)
	end

	it "has a string representation" do
		expect(@game.to_s).to eq("Welcome to Game1. There are 1 players.")
	end

	it "can list the names of players"


	it "cuddles the player if a high number is rolled" do
		allow(GameTurn).to receive(:roll_die) {5}
		@game.play(1)
		expect(@player.health).to eq(@initial_health + 15)
	end

	it "skips the player if a medium number is rolled" do
		allow(GameTurn).to receive(:roll_die) {3}
		@game.play(1)
		expect(@player.health).to eq(@initial_health)
	end

	it "pokes the player if a low number is rolled" do
		allow(GameTurn).to receive(:roll_die) {1}
		@game.play(1)
		expect(@player.health).to eq(@initial_health - 10)
	end

	it "assigns a treasure for points during a player's turn" do     
	  game = Game.new("Knuckleheads")
	  player = Player.new("moe")
	     
	  game.add_player(player)
	  
	  game.play(1)
	  
	  expect(player.points).not_to be_zero
	end

	context "with multiple players" do
		before do
			@game = Game.new("Game1")
			@initial_health = 100
			@player = Player.new("margot", @initial_health, true)
			@player2 = Player.new("cassandra", 150, true)
			@game.add_player(@player)
			@game.add_player(@player2)
		end

		it "can list the names of players"
		end

		it "computes total points as the sum of all player points" do
		  game = Game.new("Knuckleheads")
		  
		  player1 = Player.new("moe")
		  player2 = Player.new("larry")
		  
		  game.add_player(player1)
		  game.add_player(player2)
		  
		  player1.found_treasure(Treasure.new(:hammer, 50))
		  player1.found_treasure(Treasure.new(:hammer, 50))
		  player2.found_treasure(Treasure.new(:crowbar, 400))
		  
		  expect(game.total_points).to eq(500)
		end

end