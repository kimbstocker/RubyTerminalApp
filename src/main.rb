require_relative './classes/question.rb'
operators = ["+", "-", "*"]
single_digit_numbers = [1,2,3,4,5,6,7,8,9,10]
double_digit_numbers = [11,12,13]
triple_digit_numbers = (100..999).to_a
correct_answers = []
user_answers = []
# class Question
    
#     def initialize(number1, operator, number2)
#         @single_digit_number = number1
#         @double_digit_number = number2
#         @operator = operator
#     end


#     def random_question
#         @single_digit_number = single_digit_numbers.sample
#         @double_digit_number = double_digit_numbers.sample
#         @operator = operators.sample
#         random_question = @single_digit_number && @operator && @double_digit_number
#         puts "#{random_question} =?"
#         answer = input.chomp.to_i
#         answers << answer
#     end

# end

i = 1
while i <= 10 
    first_num = single_digit_numbers.sample
    second_num = single_digit_numbers.sample
    third_num = double_digit_numbers.sample
    first_operator = operators.sample
    second_operator = operators.sample

    random_question = "Q#{i}) #{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num}"
    answer = eval("#{first_num} #{first_operator} #{second_num} #{second_operator} #{third_num}")
    correct_answers << answer
    puts random_question
    input = gets.chomp.to_i
        if input == answer
            puts "right"
        else
            puts "wrong"
        end
    user_answers << input
    i += 1
end
print user_answers
print correct_answers