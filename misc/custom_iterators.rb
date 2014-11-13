#this is an example of building a custom iterator that
#does the same thing as the select method built in to the array class

numbers = (1..10).to_a

def my_select(array)
	results = []
	array.each do |element|
		results << element if yield(element)
	end
	results
end

puts my_select(numbers) {|n| n.even?}

#yield yields to the block, then goes back to the method when the block is done

def conversation
	puts "Hello!"
	yield
	puts "Goodbye!"
end

conversation { puts "Good to meet you!" }

def five_times
	1.upto(5) do |count|
		yield count
	end
end

five_times do |n|
	puts "#{n} situps"
	puts "#{n} pushups"
	puts "#{n} chinups"
end

def n_times(number)
	1.upto(number) do |count|
		yield count
	end
end

n_times(6) do |n|
	puts "#{n} situps"
	puts "#{n} pushups"
	puts "#{n} chinups"
end