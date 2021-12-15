require 'colorize'
require_relative './classes/quiz.rb'
require_relative './classes/error-handling.rb'


begin
    puts "Please enter 1 for easy, 2 for medium, 3 for hard level, q to quit!"
    user_choice = gets.chomp
    if user_choice == "q"
            puts "Thank you and goodbye!"
            exit
    elsif user_choice == "1" || user_choice == "2" || user_choice == "3"
            quiz = Quiz.new(user_choice)
            quiz.run_quiz
    else
        raise ValidationError.new("*** Please enter 1, 2, 3 or q only ***")
    end

rescue ValidationError => e
    puts e.message 
    retry 

end


# if ARGV.length > 0 
#     flag, *rest = ARGV 
#     ARGV.clear
#     case flag
#     when '-help' || '-h'
#         puts "Check the readme"
#         exit
#     when '-info'
#         puts "Written by FX2021-02"
#         exit
#     when '-path'
#         group = Group.new(rest[1] ||= "Default Group", rest[0])
#     else 
#      puts "Invalid argument, please check Readme file for more info"
#      exit 
#     end
# end  



