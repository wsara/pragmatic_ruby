Misc:

-Command for listing files in a directory is ls. ls -a shows hidden files. Think "list stuff"
-I forgot how package control 

Classes - Vocabulary Quiz

1. A *class* is a factory (blueprint) that instantiates *objects (instances)*.

2. Objects have a unique *state* and a common set of *methods (behaviors)*.

3. An *instance* variable exists for the life of an *object*.

4. *Instance* methods have access to their object's *instance* variables.

5. Class names start with a *capital* letter. 
		Method names start with a *lowercase* letter.
		Variable names start with a *lowercase* letter.
		Instance variables start with an *@ symbol*.

ABCs of Ruby
Array and Attributes
Blocks
Classes, Calling methods, and Concatenating strings
Default parameters
each method as an iterator
Finding answers in the Ruby documentation



la to list stuff

to run tests with color:

rspec movie_spec.rb --color

to run tests with more info:


rspec movie_spec.rb --color --format doc

instructions for moving to rspec's new (not really that new) expect syntax rather than should: http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax


if I want to avoid repeating myself when I call the capitalize method, I can take the method I wrote for changing a player's name and call it in the initialize method:

		self.name = name
		
		replaces

		@name = name.capitalize


when writing tests...

Do I want to use variables or actual values? Probably actual values, right?

	it "has a string representation" do
		expect(@player.to_s).to eq("I'm Sara with a health of #{@player.health} and a score of #{@player.score} and my consent value is true.")
	end

	it "computes a score as the sum of its health and length of name" do
		expect(@player.score).to eq(@player.name.size + @player.health)
	end


Suppressing output from class methods while running tests 

So when the spec runs, we need a way to "turn off" standard output. Thankfully, Ruby makes that easy by providing access to the standard output stream via the global $stdout variable (global variables always start with $). By default, $stdout is set to an input/output object that prints to the console. But we can override that by assigning a different object to $stdout. For example, a StringIO object acts just like other I/O objects, but it reads and writes to strings rather than the console. A simple workaround to our problem then is to set the global $stdout variable to a new StringIO object like so:

$stdout = StringIO.new

That way, standard output will be written to the StringIO object instead of to the console. Now, we don't want to override standard output when the game program runs. Rather, we only want to do this when the specs run—specifically before each code example runs. Change your player_spec.rb file to use this workaround.

***

NEXT TIME: write some tests for crowdfund using the random input determination thing. See playlist_spec.rb for code example. You'll know what I mean.

Think of modules as buckets of methods. You don't create objects from modules like you do with a class (in fact, you can't).


some methods can take block forms, like times, upto and each. They use do |something| end


from blocks lesson:

[1] pry(main)> numbers = (1..10).to_a
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
[2] pry(main)> numbers.select {|n| n >5}
=> [6, 7, 8, 9, 10]
[3] pry(main)> evens = numbers.select { |n| n.even? }
=> [2, 4, 6, 8, 10]
[4] pry(main)> evens
=> [2, 4, 6, 8, 10]
[5] pry(main)> odds  = numbers.select { |n| n.odd? }
=> [1, 3, 5, 7, 9]
[6] pry(main)> odds
=> [1, 3, 5, 7, 9]
[7] pry(main)> odds  = numbers.reject { |n| n.even? }
=> [1, 3, 5, 7, 9]
[8] pry(main)> odds
=> [1, 3, 5, 7, 9]
[9] pry(main)> evens, odds = numbers.partition { |n| n.even? }
=> [[2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]
[10] pry(main)> evens
=> [2, 4, 6, 8, 10]
[11] pry(main)> odds
=> [1, 3, 5, 7, 9]
[12] pry(main)> numbers.reduce { |sum, n| sum + n }
=> 55
[13] pry(main)> numbers.reduce(:+)
=> 55
[14] pry(main)> numbers.reduce(:*)
=> 3628800

[1] pry(main)> numbers = [24, 13, 8, 65]
=> [24, 13, 8, 65]
[2] pry(main)> numbers.any? { |n| n > 20 }
=> true
[3] pry(main)> numbers.detect { |n| n > 20 }
=> 24

[6] pry(main)> numbers_doubled = numbers.map { |n| n * 2 }
=> [48, 26, 16, 130]
[7] pry(main)> numbers
=> [24, 13, 8, 65]
[8] pry(main)> numbers_doubled
=> [48, 26, 16, 130]


----combined comparison operator/spaceship operator-----
<=>	Combined comparison operator. Returns 0 if first operand equals second, 1 if first operand is greater than the second and -1 if first operand is less than the second.	(a <=> b) returns -1.



-----symbols and structs------
symbols start with a colon like
	:name, :health
symbols are just a way to name things in our code
strings ("green) are separate objects--symbols (:green) are always the same object
to_s and to_sym convert back and forth
you use symbols when you want to name something like an attribute or an option, and use strings when you want string function like text processing

a constant in ruby is all uppercase: SNACKS

structs are kind of weird, and people don't use them all that much! They're sort of like when you want something that behaves like a class and generates class objects, but without writing a full class. It automatically creates accessor methods for the struct's attributes.

Or:

"A Struct is a convenient way to bundle a number of attributes together, using accessor methods, without having to write an explicit class.

The Struct class generates new subclasses that hold a set of members and their values. For each member a reader and writer method is created similar to Module#attr_accessor."


---------hashes-----------
Saras-MacBook-Air:~ Sara$ pry
                           
[1] pry(main)> moes_treasures = { :hammer => 50 }
=> {:hammer=>50}
[2] pry(main)> moes_treasures[:crowbar] = 400
=> 400
[3] pry(main)> moes_treasures
=> {:hammer=>50, :crowbar=>400}
[4] pry(main)> moes_treasures.size
=> 2

[6] pry(main)> moes_treasures[:hammer]
=> 50
[7] pry(main)> moes_treasures[:crowbar]
=> 400
[8] pry(main)> moes_treasures[:balloon]
=> nil
[9] pry(main)> moes_treasures[:hammer] += 50
=> 100
[10] pry(main)> moes_treasures[:hammer]
=> 100
[11] pry(main)> moes_treasures.each { |key, value| puts "#{key} adds up to #{value} points" }
hammer adds up to 100 points
crowbar adds up to 400 points
=> {:hammer=>100, :crowbar=>400}
[12] pry(main)> moes_treasures.keys
=> [:hammer, :crowbar]
[13] pry(main)> moes_treasures.values
=> [100, 400]
[14] pry(main)> moes_treasures.values.reduce(:+)
=> 500

an empty hash is {}
creating a hash:

>> moes_treasures = { :hammer => 50 }

adding to a hash: 

>> moes_treasures[:crowbar] = 400

"Look inside almost every Ruby program and you'll find hashes. They pop up all over the place, and for good reason. It's very common in programming to want to associate one thing (a key) with another (a value) and create a collection of these key-value pairs. For example, in our game each player needs to remember the name of a found treasure and its respective total point value.

Unlike arrays which are indexed by integers, you index a hash by keys. Any object can be used as a hash key, but the most common type of key is a symbol. To look up the total point value for a specific found treasure, we'll index into the hash with that treasure's name."

When you iterate through a hash, for example with the each method, you declare the block to take two parameters--the first will be its key, and the second value. For example:

snack_carbs each { |key, value| puts "#{key} has #{value} carbs" }




----custom iterators-----
I barely know what I am doing here

in the print stats method of the playlist class we added this:

			movie.each_snack do |snack|
				puts "#{snack.carbs} total #{snack.name} carbs"
			end

which is calling the eat_snacks method we added to the movie class:

	def each_snack
		@snack_carbs.each do |name, carbs|
			snack = Snack.new(name, carbs)
			yield snack
		end
	end