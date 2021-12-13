
$operators = ["+", "-", "*"]
range_1 = (1..9)
range_2 = (10..99)
range_3 = (100..999)
$single_digit_numbers = range_1.to_a
$double_digit_numbers = range_2.to_a
$triple_digit_numbers = range_3.to_a

class Quiz

    attr_accessor :username
    attr_accessor :correct_answers
    attr_accessor :user_answers

    def initialize(level)
        @@username = username
        @level = level
        @first_num = $single_digit_numbers.sample
        @second_num = $single_digit_numbers.sample
        @third_num = $double_digit_numbers.sample
        @first_operator = $operators.sample
        @second_operator = $operators.sample
        @@correct_answers = []
        @@user_answers = []
    end

    def random_question

        if @level == 1
            i = 1
            while i <= 10 
                @random_question = "Q#{i}) #{@first_num} #{@first_operator} #{@second_num} #{@second_operator} #{@third_num}"
                @answer = eval("#{@first_num} #{@first_operator} #{@second_num} #{@second_operator} #{@third_num}")
                @@correct_answers << @answer
                puts random_question
                @input = gets.chomp.to_i
                    if @input == @answer
                        puts "Right"
                    else
                        puts "Wrong"
                    end
                @@user_answers << @input
                i += 1
            end
        end
    end
end

