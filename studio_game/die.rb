class Die
	attr_reader :number
	
	def initialize
		roll
	end

	def roll
		@number = rand 1..6
	end

	def to_s
		
	end
end

if __FILE__ == $0
	die = Die.new
	die.roll
	puts "#{die.number}"
	puts die
end