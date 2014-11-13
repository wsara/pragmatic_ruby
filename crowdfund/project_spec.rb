require_relative "project"

describe Project do
	before do
		@project = Project.new("Cute Robots", 10, 100)
		@die = Die.new
		$stdout = StringIO.new
	end

	it "has an initial target funding amount" do
		expect(@project.goal).to eq(100)
	end

	it "computes the total funding outstanding as the target funding amount minus the funding amount" do
		expect(@project.funding_needed).to eq(90)
	end

	it "increases funds by the correct amount when funds are added" do
		@project.fund(10)
		expect(@project.current_funds).to eq(20)
	end

	it "decreases funds by the correct amount when funds are removed" do
		@project.defund(5)
		expect(@project.current_funds).to eq(5)
	end

	it "can check if a project is funded" do
		expect(@project.funded?).to eq(false)
	end

	it "can fund a project if a high number is rolled" do
	end

	context "using default values" do
		before do
			@project = Project.new("Cute Robots")
		end
		it "has a default value of 0 for funding amount" do
			expect(@project.current_funds).to eq(0)
		end

		it "has a default goal of 0" do
			expect(@project.goal).to eq(0)
		end

		it "can check if a project is funded" do
			expect(@project.funded?).to eq(true)
		end
	end
end