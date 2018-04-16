# YOUR CODE, HERE

long_string = "Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum"
#Problem: Given a sentence, find the longest word.

#Call the .split method on the string to get an array of words.
long_string_array = long_string.split
#puts long_string_array.inspect

#Use a separate array to store the lengths of each word.
word_length_array = long_string_array.map {|word| word.length}
#puts word_length_array.inspect
reverse_sorted_lengths = word_length_array.sort.reverse
#puts reverse_sorted_lengths[0]
longest_word = long_string_array.find {|word| word.length == reverse_sorted_lengths[0]}
puts "Longest word: #{longest_word}"

#####Concise solution 1###########
# sorted_array = long_string_array.sort_by {|word| word.length}
# longest_word = sorted_array[-1]
# puts "Longest word from the String: #{longest_word}"

### Concise Solution 2 #####
#puts long_string_array.max_by {|word| word.length}

#Problem: Given a sentence, find the most common letter used.
long_string_char_ary = long_string.downcase.split('')
#puts long_string_char_ary.inspect

char_counts = []
26.times do
  char_counts << 0
end

long_string_char_ary.each do |ch|
  #Check for spaces etc..
  if ch.ord >= "a".ord && ch.ord <= "z".ord
        char_counts[ch.ord - "a".ord] += 1
  end
end

#find the most common character-count index in the char_counts array
# this will co-relate to the actual character amongst 26 characters 'a....z'
max_char_count = -1
max_char_index = -1
char_counts.each_with_index do |count, index|
  if count > max_char_count
    max_char_count = count
    max_char_index = index
  end
end
#puts char_counts.insputs ""pect
#puts max_char_index
max_char = ('a'.ord + max_char_index).chr
puts "Most Common cahracter is: #{max_char}"


#Decoder Ring
# #decoder = "abcdefghijklmnopqrstuvwxyz".chars
# decoder = ["", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
# "s", "t", "u", "v", "w", "x", "y", "z", " "]
# #puts decoder.inspect
#
# secret_message = "7 15 15 4 27 4 15 7"
# secret_message_ary = secret_message.split
#
# decoded_msg = ""
# secret_message_ary.each do |item|
#   decoded_msg += decoder[item.to_i]
# end
# puts "Decoded Message: #{decoded_msg}"

#You're given a string of numbers 1 - 27.
# 1 - 26 represents the correlating letter in the alphabet
# 27 represents a space

secret_message = "7 15 15 4 27 4 15 7"
secret_message_ary = secret_message.split
#puts secret_message_ary.inspect
#decoded_msg = ""

decoded_msg = secret_message_ary.inject("") do |digit_str, item|
  if item == "27"
    digit_str += " "
  else
    # "1" -> a and so on.....
    digit_str += (item.to_i - 1 + "a".ord).chr
  end
end
puts "Decoded Message is: #{decoded_msg}"


#Finding Primes
random_numbers = []
10.times do
  random_numbers << rand(9) + 1
end
puts "Random Array: #{random_numbers}"

prime_nums = random_numbers.select do |num|
  num <= 3 || num % Math.sqrt(num).to_i != 0
end
puts "Prime number Array: #{prime_nums}"
