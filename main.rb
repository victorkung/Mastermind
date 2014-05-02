load 'methods.rb'

# PREDEFINED VARIABLES

colors = ['R', 'G', 'B', 'Y', 'O', 'P']
seq_length = 4
total_color = colors.length
max_tries = 10
tries = 1
input_array = []
win = false
input = ""


#  Intro and Instructions
puts "\nWelcome to Mastermind!\n\n"
puts "INSTRUCTIONS:\nInput a code sequence of 4 random colors from a total of six colors (Red, Green, Blue, Yellow, Orange, Purple) and the computer will try to guess it within 10 turns\n\n"
puts "===============================================================================\n\n"

# User Input Code
answer = accept_input(seq_length)
puts "===============================================================================\n\n"
puts "Your Answer: #{answer} is invisible to the computer \n\n"


# Main Loop of the Game
loop do

	if win
		puts "===============================================================================\n\n\n"
		puts "The computer guessed the correct sequence #{answer} in just #{tries} guesses.\n\n\n"
		puts "===============================================================================\n\n"
		break

	# If Exceed max_tries, End the Game
	elsif tries > max_tries
		puts "===============================================================================\n\n\n"
		puts "You beat the computer! The computer was unable to guess the code in 10 tries\n\n\n"
		puts "===============================================================================\n\n\n"
		break

	elsif win == false
		puts "===============================================================================\n\n\n"
		puts "TRY NUMBER: #{tries}\n\n "

		# If First Try, Computer Makes a Random Guess
		if tries == 1
			guess = [colors.sample, colors.sample, colors.sample, colors.sample]
			puts "Guess is: #{guess}\n\n"
			score = scoring(answer, guess, colors)
			puts "Score: #{score}"

			# GENERATE ALL POSSIBLE COMBINATIONS

			# FILTER THESE BASED ON SCORE

		# If Second to Tenth Try, Use Pruning Algorithm
		else
			puts "balls\n\n"

		end

		if score == [2, 2, 2, 2]
			win = true
		end

		tries += 1

	end

end
