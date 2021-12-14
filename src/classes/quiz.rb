require 'colorize'


$operators = ["+", "-", "*"]
$single_digit_numbers = (1..9).to_a
$double_digit_numbers = (10..99).to_a
$triple_digit_numbers = (100..999).to_a

class Quiz

    attr_accessor :correct_answers
    attr_accessor :user_answers

    def initialize(level)
        @level = level
        @questions = []
        @correct_answers = []
        @user_answers = []
    end


    def run_quiz
        ask_questions
        print_scorecard
    end

    def ask_questions
        10.times do
            single_digit_num_one = $single_digit_numbers.sample
            single_digit_num_two = $single_digit_numbers.sample
            double_digit_num_one = $double_digit_numbers.sample
            double_digit_num_two = $double_digit_numbers.sample
            triple_digit_num = $triple_digit_numbers.sample
            first_operator = $operators.sample
            second_operator = $operators.sample
            third_operator = $operators.sample
            case @level
                when 1
                    random_numbers = [single_digit_num_one, single_digit_num_two, double_digit_num_one].shuffle
                    question = "#{random_numbers[0]} #{first_operator} #{random_numbers[1]} #{second_operator} #{random_numbers[2]}"
                    
                when 2
                    random_numbers = [single_digit_num_one, double_digit_num_one, double_digit_num_two].shuffle
                    question = "#{random_numbers[0]} #{first_operator} #{random_numbers[1]} #{second_operator} #{random_numbers[2]}"
                when 3
                    random_numbers = [single_digit_num_one, double_digit_num_one, double_digit_num_two, triple_digit_num].shuffle
                    question = "#{random_numbers[0]} #{first_operator} #{random_numbers[1]} #{second_operator} #{random_numbers[2]} #{third_operator} #{random_numbers[3]}"
            end

            answer = eval(question)
            @questions << question
            @correct_answers << answer
            puts question
            input = gets.chomp.to_i
            if input == answer
                puts "Right".green
            else
                puts "Wrong".red
            end
            @user_answers << input
        end
       
    end


    def print_scorecard
        total_score = 0
        (0...@user_answers.length).each do |i|
            if @user_answers[i] == @correct_answers[i]
                score = 1
            else 
                score = 0
            end
            puts "Q#{i+1}, #{@questions[i]}\nYour answer:    #{@user_answers[i]}\nCorrect answer: #{@correct_answers[i]}\nYour Score: #{score}"
            puts
            total_score += score  
        end
        puts "Your total score is #{total_score}"
    end


end

