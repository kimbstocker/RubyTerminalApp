require 'colorize'
require_relative './classes/quiz.rb'
require_relative './classes/error-handling.rb'

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


while true
    begin
        puts "Welcome to Mad Math Quiz! Let's get started with a username, enter anything and it will be your username for this application!"
        username = gets.chomp
        puts "Please enter 1 for easy, 2 for medium, 3 for hard level, q to quit!"
        user_choice = gets.chomp
        if user_choice == "q"
                puts "Thank you and goodbye!"
                exit
        elsif user_choice == "1" || user_choice == "2" || user_choice == "3"
                quiz = Quiz.new(username, user_choice)
                quiz.run_quiz
        else
            raise ValidationError.new("*** Please enter 1, 2, 3 or q only ***")
        end

    rescue ValidationError => e
        puts e.message 
        retry 
    end
end



 



