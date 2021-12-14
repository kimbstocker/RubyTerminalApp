require_relative './quiz.rb'

class ScoreCard

    attr_accessor :correct_answers
    attr_accessor :user_answers

    def initialize
    end
        
    def print_scorecard
        i = 0
        total_score = 0
        while i <= 10
            if @user_answers[i] == @correct_answers[i]
                score = 1
            else 
                score = 0
            end
            puts "Your answer   #{@user_answers[i]}     Correct answer #{@correct_answers[i]}       Your Score   #{score}"
            total_score += score  
            i += 1
        end
        puts "Your total score is #{total_score}"
    end
    # def save_scorecard
    #     File.open(@file_path, "w+") do |f| 
    #         f.puts(@names_array)
    #     end 
    # end 
end