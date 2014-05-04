# PREDEFINED VARIABLES


# ACCEPTING USER GENERATED CODE

def accept_input(length)
  print "Enter your 4 sequence color code. Select from R (Red), G (Green), B (Blue), Y (Yellow), O (Orange), P (Purple). \n\nYour input should be in the form: RGBY: "
  input = gets.chomp
  input_check = input.gsub(/[RGBYOP]/, "")
  puts "\n"

  # Account for Incorrect Inputs      ### IMPORTANT ###
  if input.length != length || input_check.length != 0
    puts "===============================================================================\n\n"
    puts "ERROR:\nPlease follow the instructions and enter a 4 sequence color code!\n\n"
    puts "===============================================================================\n\n"
    input = ""
    answer = accept_input(length)
  else
    answer = input.split("")      # Storing the input as an array
  end
  return answer
end


# SCORING METHOD

def scoring(answer, guess, colors)

  # Returning the Number of Correct Color & Positions
  correct_positions = guess.select.with_index {|x,i| x == answer[i]}

  # Returning the Number of Correct Colors (not including those with BOTH Correct Color and Position)
  # By Removing Elements in Each Array that Have the Same Color and Position
  trimmed_guess = guess.select.with_index {|x,i| x != answer[i]}
  trimmed_answer = answer.select.with_index {|x,i| x != guess[i]}

  # Create Hashes to Store the Frequencies of the Modified Arrays
  input_freq = Hash.new(0)
  trimmed_guess.each { |color| input_freq[color] += 1}
  answer_freq = Hash.new(0)
  trimmed_answer.each { |color| answer_freq[color] += 1}

  # Compare the Frequencies in Both Hashes to Calculate Number of Current Colors
  correct_colors = 0
  black = 2
  white = 1
  neither = 0

  colors.each do |c|
    if answer_freq[c] == input_freq[c] && input_freq[c] == 0
    elsif answer_freq[c] == input_freq[c] && input_freq[c] != 0
      correct_colors += [answer_freq[c], input_freq[c]].min
    elsif (answer_freq[c] != input_freq[c]) && (answer_freq[c] != 0) && (input_freq[c] != 0)
      correct_colors += [answer_freq[c], input_freq[c]].min
    end
  end

  # Creating the Score Array
  score = Array.new

  correct_positions.size.times do
  score.push black
  end

  correct_colors.times do
  score.push white
  end

  num_neither = 4 - correct_positions.size - correct_colors

  num_neither.times do
  score.push neither
  end

  return score

end
