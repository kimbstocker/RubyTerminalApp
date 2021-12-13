

class Question
    # def initialize(level)
    #     @@level = level
    #     @number = number
    #     @operator = operator
    #     @@answer = answer
    #     @single_digit_numbers = single_digit_numbers
    #     @double_digit_numbers = double_digit_numbers
    #     @triple_digit_numbers = triple_digit_numbers
    # end

    def random_question
        @@random_question = @single_digit_numbers.sample && @operators.sample && @double_digit_numbers.sample
        puts "#{@@random_question} =?"
        @@answer = input.chomp.to_i
        answers << @@answer
    end

end

