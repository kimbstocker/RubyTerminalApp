
$operators = ["+", "-", "*"]
$single_digit_numbers = (1..9).to_a
$double_digit_numbers = (10..99).to_a
$triple_digit_numbers = (100..999).to_a

class EasyLevelQuiz

    attr_accessor :correct_answers
    attr_accessor :user_answers

    # def initialize(level)
    def initialize
        @correct_answers = []
        @user_answers = []
    end

    def random_question
        
        i = 1
        while i <= 10 
            first_num = $single_digit_numbers.sample
            second_num = $single_digit_numbers.sample
            third_num = $double_digit_numbers.sample
            first_operator = $operators.sample
            second_operator = $operators.sample
            question = "Q#{i}) #{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num}"
            answer = eval("#{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num}")
            @correct_answers << answer
            puts question
            input = gets.chomp.to_i
                if input == answer
                    puts "Right"
                else
                    puts "Wrong"
                end
            @user_answers << input
            i += 1
        end
        
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
end


class MediumLevelQuiz

    attr_accessor :correct_answers
    attr_accessor :user_answers

    # def initialize(level)
    def initialize
        @correct_answers = []
        @user_answers = []
    end

    def random_question
        
            i = 1
            while i <= 10 
                first_num = $single_digit_numbers.sample
                second_num = $double_digit_numbers.sample
                third_num = $double_digit_numbers.sample
                first_operator = $operators.sample
                second_operator = $operators.sample
                question = "Q#{i}) #{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num}"
                answer = eval("#{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num}")
                @correct_answers << answer
                puts question
                input = gets.chomp.to_i
                    if input == answer
                        puts "Right"
                    else
                        puts "Wrong"
                    end
                @user_answers << input
                i += 1
            end
        
    end
end

class HardLevelQuiz

    attr_accessor :correct_answers
    attr_accessor :user_answers

    # def initialize(level)
    def initialize
        @correct_answers = []
        @user_answers = []
    end

    def random_question
        
            i = 1
            while i <= 10 
                first_num = $single_digit_numbers.sample
                second_num = $double_digit_numbers.sample
                third_num = $double_digit_numbers.sample
                fourth_num = $triple_digit_numbers.sample
                first_operator = $operators.sample
                second_operator = $operators.sample
                third_operator = $operators.sample
                question = "Q#{i}) #{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num} #{third_operator} #{fourth_num}"
                answer = eval("#{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num} #{third_operator} #{fourth_num}")
                @correct_answers << answer
                puts question
                input = gets.chomp.to_i
                    if input == answer
                        puts "Right"
                    else
                        puts "Wrong"
                    end
                @user_answers << input
                i += 1
            end
        
    end
end
