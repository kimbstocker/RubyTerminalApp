require_relative './classes/quiz.rb'
require_relative './classes/scorecard.rb'

puts "Choose level 1, 2 or 3"
input = gets.chomp.to_i
case input
    when 1
        quiz = EasyLevelQuiz.new
        quiz.random_question
    when 2
        quiz = MediumLevelQuiz.new
        quiz.random_question
    when 3
        quiz = HardLevelQuiz.new  
        quiz.random_question 
end


