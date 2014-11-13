require_relative 'player'
require_relative 'treasure_trove'

describe Player do
	before do
		@initial_health = 150
		@player = Player.new("sara", @initial_health, true)
		$stdout = StringIO.new
	end

	it "has a capitalized name" do
		expect(@player.name).to eq("Sara")
	end

	it "should still have a capitalized name when changed" do
		@player.name = "babysnakes"
		expect(@player.name).to eq("Babysnakes")
	end

	it "has an initial health" do
		expect(@player.health).to eq(150)
	end

	it "has a string representation" do
		expect(@player.to_s).to eq("I'm Sara with a health of 150 and a score of 150 and my consent value is true.")
	end

	it "computes a score as the sum of its health and points" do
		@player.found_treasure(Treasure.new(:shinygem, 50))
		@player.found_treasure(Treasure.new(:shinygem, 50))

		expect(@player.score).to eq(250)
	end

	it "increases health by 15 when cuddled" do
		@player.cuddle
		expect(@player.health).to eq(@initial_health + 15)
	end

	it "decreases health by 10 when poked" do
		@player.poke
		expect(@player.health).to eq(@initial_health - 10)
	end

	it "computes points as the sum of all treasure points" do
	  expect(@player.points).to eq(0)

	  @player.found_treasure(Treasure.new(:shinygem, 50))

		expect(@player.points).to eq(50)

	  @player.found_treasure(Treasure.new(:megagem, 400))
	  
	  expect(@player.points).to eq(450)
	  
	  @player.found_treasure(Treasure.new(:shinygem, 50))

	  expect(@player.points).to eq(500)
	end

	it "yields each found treasure and its total points" do
	  @player.found_treasure(Treasure.new(:skillet, 100))
	  @player.found_treasure(Treasure.new(:skillet, 100))
	  @player.found_treasure(Treasure.new(:hammer, 50))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  
	  yielded = []
	  @player.each_found_treasure do |treasure|
	    yielded << treasure
	  end
	  
	  expect(yielded).to eq([
	    Treasure.new(:skillet, 200), 
	    Treasure.new(:hammer, 50), 
	    Treasure.new(:bottle, 25)
	 	])
	end

	context "health is greater than 100" do
		before do
			@player = Player.new("llama", 150, true)
		end

		it "is strong" do
			expect(@player).to be_strong
		end
	end

	context "health is less than 100" do
		before do
			@player = Player.new("llama", 90, true)
		end

		it "is not strong" do
			expect(@player).not_to be_strong
		end
	end

	context "consent is false" do
		before do
			@player = Player.new("sara", @initial_health)
		end

		it "should not lower health from poking" do
			@player.poke
			expect(@player.health).to eq(@initial_health)
		end

		it "should not raise health from cuddling" do
			@player.cuddle
			expect(@player.health).to eq(@initial_health)
		end
	end

	context "consent is true" do
		before do
			@player = Player.new("sara", @initial_health, true)
		end

		it "should lower health from poking" do
			@player.poke
			expect(@player.health).to eq(@initial_health - 10)
		end

		it "should raise health from cuddling" do
			@player.cuddle
			expect(@player.health).to eq(@initial_health + 15)
		end
	end
	
	context "in a collection of players" do
		before do
			@player1 = Player.new("Ao", 100, true)
			@player2 = Player.new("Bex", 100, true)
			@player3 = Player.new("Cretacious", 100, true)

			@players = [@player1, @player2, @player3]

			@player2.found_treasure(Treasure.new(:gem, 50))
			@player3.found_treasure(Treasure.new(:megagem, 400))
		end

		it "is sorted by decreasing score" do
			expect(@players.sort).to eq([@player3, @player2, @player1])
		end
	end

end