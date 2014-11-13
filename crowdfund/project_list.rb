require_relative "project"

class Project_List
	attr_reader :list_name, :user

	def initialize(list_name, user)
		@list_name = list_name
		@user = user
		@projects = []
	end

	def add(project)
		@projects << project
	end

	def list
		puts "A list of #{@user}'s Favorite Projects: \"#{@list_name}\""

		@projects.each do |project|
			puts project
			FundingRound.fund_randomly(project)
		end
	end

	def high_to_low
		puts "\nAll projects by current funding:"
		@projects.sort.each do |project|
			puts "#{project.name}: $#{project.current_funds}"
		end
	end

	def print_name_and_funding(project)
		puts "#{project.name}: $#{project.current_funds} out of $#{project.goal} funded."
	end

	def list_by_funded
		funded_projects = @projects.select { |project| project.funded? }
		unfunded_projects = @projects.reject { |project| project.funded? }

		puts "\n#{funded_projects.size} funded project(s):"
		funded_projects.each do |project|
			print_name_and_funding(project)
		end

		puts "\n#{unfunded_projects.size} Unfunded project(s):"
		unfunded_projects.each do |project|
			print_name_and_funding(project)
		end
	end
end