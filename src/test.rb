operators = ["+", "-", "*"]
single_digit_numbers = [1,2,3,4,5,6,7,8,9,10]
double_digit_numbers = [11,12,13]
triple_digit_numbers = (100..999).to_a
answers = []


first_num = single_digit_numbers.sample
second_num = double_digit_numbers.sample
first_operator = operators.sample

random_question = "#{first_num} #{first_operator} #{second_num}"
answer = eval(random_question)
puts random_question
input = gets.chomp.to_i
    if input == answer
        answers << input
        puts "right"
    else
        puts "wrong"
    end

puts first_num
puts second_num
puts first_operator
puts answer