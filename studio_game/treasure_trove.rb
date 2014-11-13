Treasure = Struct.new(:name, :points)

module TreasureTrove
	TREASURES = [
		Treasure.new(:gem, 5),
		Treasure.new(:bluegem, 25),
		Treasure.new(:shinygem, 50),
		Treasure.new(:dragongem, 100),
		Treasure.new(:ultragem, 200),
		Treasure.new(:megagem, 400)
	]

	def self.random
		TREASURES.sample
	end
end
