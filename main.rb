colors = ['R', 'G', 'B', 'Y', 'O', 'P']
seq_length = 4
total_color = colors.length
max_guesses = 10
guesses = 0
input_array = []


# HUMAN GUESSING AGAINST COMPUTER GENERATED CODE

#  Intro and Instructions
puts "\nWelcome to Mastermind!\n\n"
puts "INSTRUCTIONS:\nThe goal is to guess a sequence of 4 random colors from a total of six colors (Red, Green, Blue, Yellow, Orange, Purple) in the fewest number of moves."
puts "Every time you make a guess, the computer will provide you feedback by providing up to four key pegs (white or black). A single black peg is provided for each color from the guess that is correct in both color and position. While a white peg indicates the existence of a correct color peg placed in the wrong position.\n\n"
puts "Type 'quit' to exit the game and 'answer' to reveal the correct sequence.\n\n\n"


# Computer-Generated Sequence Answer
answer = [colors.sample, colors.sample, colors.sample, colors.sample]

loop do

	# Storing User Input
	puts "=========================================================================================\n\n\n"
	print "Enter your 4 sequence color code. Select from R (Red), G (Green), B (Blue), Y (Yellow), O (Orange), P (Purple). Your input should be in the form: RGBY: "
	input = gets.chomp
	puts "\n\n"

	# Exit Options
	if input == "quit"
		exit
	elsif input == "answer"
		puts "The correct sequence was #{answer.join}. \n\n"
		exit
	end

	# Account for Incorrect Input # IMPORTANT
	if input.length != 4
		puts "Please follow the instructions and enter a 4 sequence color code. \n\n\n"
		redo
	else
		input_array = input.split("")						# Storing the input as an array
	end

	guesses += 1
	break if input_array == answer

	# Returning the Number of Correct Color & Positions
	pos = input_array.select.with_index {|x,i| x == answer[i]}
	correct_positions = pos.size

	# Returning the Number of Correct Colors (not including those with BOTH Correct Color and Position)
	input_array_mod = input_array.select.with_index {|x,i| x != answer[i]}			# remove elements in each array that have the same color and position
	answer_mod = answer.select.with_index {|x,i| x != input_array[i]}

	answer_freq = Hash.new(0)																								# create hash storing the frequencies of the modified arrays
	answer_mod.each { |color| answer_freq[color] += 1}
	input_freq = Hash.new(0)
	input_array_mod.each { |color| input_freq[color] += 1}

	correct_colors = 0

	colors.each do |c|
		if answer_freq[c] == input_freq[c] && input_freq[c] == 0
		elsif answer_freq[c] == input_freq[c] && input_freq[c] != 0
			correct_colors += [answer_freq[c], input_freq[c]].min
		elsif answer_freq[c] != input_freq[c] && answer_freq[c] != 0 && input_freq[c] != 0
			correct_colors += [answer_freq[c], input_freq[c]].min
		end
	end

	puts "Your guess: #{input_array} \n\n"
	puts "The answer: #{answer}\n\n"

	puts "You have #{correct_positions} black peg(s) and #{correct_colors} white peg(s) \n\n"

	puts "Trimmed Down Input Array: #{input_array_mod}\n\n"
	print "Frequencies: #{input_freq}\n\n"

	puts "Trimmed Down Answer Array: #{answer_mod}\n\n"
	print "Frequencies: #{answer_freq}\n\n\n"

end

puts "=========================================================================================\n\n\n"
puts "CONGRATULATIONS! You guessed the correct sequence #{answer} in #{guesses} guesses.\n\n\n"
puts "=========================================================================================\n\n"
