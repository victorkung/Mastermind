load 'methods.rb'

# PREDEFINED VARIABLES

colors = ['R', 'G', 'B', 'Y', 'O', 'P']
total_color = colors.length
total_combo = colors.repeated_permutation(4).to_a 								# all possible code combinations
guess = [colors.sample, colors.sample, colors.sample, colors.sample]			# first guess of the game (random)
tries = 1
max_tries = 10
input = ""
input_array = []
prune_combo = []
score = nil
line_break = "===============================================================================\n\n"


# THE MASTERMIND GAME

#  Intro and Instructions
puts "\nWelcome to Mastermind!\n\n"
puts "INSTRUCTIONS:\nInput a code sequence of 4 random colors from a total of six colors (Red, Green, Blue, Yellow, Orange, Purple) and the computer will try to guess it within 10 turns\n\n"
puts line_break


# User Input Code
answer = accept_input(4)
puts line_break
puts "Your code #{answer} is invisible to the computer. The computer will begin to guess now... \n\n"


# Main Loop of the Game
loop do

	puts line_break
	puts "TRY NUMBER: #{tries}\n\n "

	# If First Try, Computer Makes a Random Guess
	if tries == 1
		puts "Guess is: #{guess}\n\n"
		score = scoring(answer, guess, colors)
		puts "Score: #{score}\n\n"


		# FILTER THESE BASED ON SCORE

	# If Between Second and Tenth Try
	else

		# Use Pruning Algorithm to Filter All Possible Combinations by Comparing Them to the Initial Guess and Seeing if the Resulting Score is Equal to the Initial Score
		total_combo.each do |combo|
			prune_score = scoring(guess, combo, colors)
			if prune_score == score
				prune_combo.push combo
			end
		end

		# Pick New Guess from Pruned Combination
		guess = prune_combo.sample
		prune_combo.delete(guess)			# delete new guess from the Prune Combination array
		total_combo = prune_combo 		# reset total_combo to the prune_combo
		prune_combo = []

		puts "Guess is: #{guess}\n\n"
		score = scoring(answer, guess, colors)
		puts "Score: #{score}\n\n"

	end


	# Winning
	if score == [2, 2, 2, 2]
		puts line_break
		puts "YOU LOSE!\n\nThe computer guessed the correct sequence #{answer} in just #{tries} guesses.\n\n\n"
		puts line_break
		break
	end

	tries += 1

	if tries > max_tries
		puts line_break
		puts "YOU WIN!\n\nYou beat the computer! The computer was unable to guess the code in 10 tries\n\n\n"
		puts line_break
		break
	end

end
