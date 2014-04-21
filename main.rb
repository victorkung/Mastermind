colors = ['R', 'G', 'B', 'Y', 'O', 'P']
seq_length = 4
total_color = colors.length
max_guesses = 10
guess = 0


#  INTRO AND INSTRUCTIONS

puts "Welcome to Mastermind!"
puts "Try and outsmart the computer. Choose from a total of six colors to create any 4 color sequence code that the computer will attempt to guess within 10 turns. \n\n"

# STORING USER INPUT CODE

print "Enter your 4 sequence color code. Select from R (Red), G (Green), B (Blue), Y (Yellow), O (Orange), P (Purple). Your input should be in the form [RGBYOP]: \n\n"
input = gets.chomp.gsub(/[aeiou]/, "")
if input.length != 4
	puts "Please follow the instructions and enter a 4 sequence color code."
end

# Storing the input as an array
answer = input.split("")

# Creating a hash table to count the frequency of each color in the user-submitted code
answer_freq = Hash.new(0)
answer.each { |color| answer_freq[color] += 1}

print "#{input}: #{answer_freq}"

