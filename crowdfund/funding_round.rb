require_relative 'project'
require_relative 'die'

module FundingRound
	def self.fund_randomly(project)
		die = Die.new
		number_rolled = die.roll 
		case number_rolled
		when 6
			project.fund(20)
		when 5
			project.fund(10)
		when 2
			project.defund(10)
		when 1
			project.defund(20)
		else
			puts "Project #{project.name} was skipped."
		end
	end
end

