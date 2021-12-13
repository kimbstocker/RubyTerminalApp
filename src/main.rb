require_relative './classes/quiz.rb'
require_relative './classes/scorecard.rb'

puts "Choose level 1, 2 or 3"
input = gets.chomp
if input == "1"
    quiz1 = Quiz.new(1)
end

quiz1.random_question
