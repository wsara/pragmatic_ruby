require_relative 'die'
require_relative 'funding_round'

class Project
	attr_reader :current_funds, :goal
	attr_accessor :name

	def initialize(name, current_funds = 0, goal = 0)
		@name = name.capitalize
		@current_funds = current_funds
		@goal	=	goal
	end

	def <=>(other)
		other.current_funds <=> current_funds
	end

	def fund(amount = 0)
		@current_funds += amount
		puts "Project #{@name} gained $#{amount} in funding!"
	end

	def defund(amount = 0)
		@current_funds -= amount
		puts "Project #{@name} lost $#{amount} in funding!"
	end

	def funding_needed
		@goal - @current_funds
	end

	def funded?
		if funding_needed <=0
			true
		else
			false
		end
	end		

	def to_s
		if funded? == false
			"Project #{@name} has $#{@current_funds} in funding towards a goal of $#{@goal}. It only has $#{funding_needed} to go!"
		else
			"Project #{@name} has $#{@current_funds} in funding towards a goal of $#{@goal}. It is fully funded!"
		end
	end
end

if __FILE__ == $0
	project1 = Project.new("magic cats", 10000, 9000)
	puts project1.funding_needed
	puts project1.funded?
	puts project1
	project2 = Project.new("mega burrito", 200, 5000)
	project2.fund(10)
	project2.defund(5)
	puts project2
	project1.randomize
	project2.randomize
end
