vowel_like = "AEFHILMNORSX"
puts "What's your name?"
name = gets.chomp.upcase
name.each_char { |character| puts vowel_like.include?(character) ? "Give me an... " + character : "Give me a.... " + character }
puts name + "'s just GRAND!"
