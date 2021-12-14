require_relative './classes/quiz.rb'
require_relative './classes/scorecard.rb'

puts "Choose level 1, 2 or 3"
input = gets.chomp.to_i
case input
    when 1
        quiz = Quiz.new(1)
        quiz.random_question
        quiz.print_scorecard
    when 2
        quiz = Quiz.new(2)
        quiz.random_question
        quiz.print_scorecard
       
    when 3
        quiz = Quiz.new(3)
        quiz.random_question
        quiz.print_scorecard
       
end


