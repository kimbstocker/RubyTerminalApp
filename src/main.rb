require 'colorize'
require_relative './classes/quiz.rb'
require_relative './classes/error-handling.rb'
require_relative './methods.rb'


if ARGV.length > 0 
    flag, *rest = ARGV 
    ARGV.clear
    case flag
    when '-help'
        puts "-r username level        :shortcut to start the Quiz (username: your username, level: 1, 2 or 3 only)"
        puts "-info                    :to view history of the app and developer information"
        exit
    when '-info'
        puts "This terminal application namely 'Mad Math Quiz' is written by Kim Stocker in December - 2021 for CoderAcademy Full-stack Developer Course - Term 1 assignment"
        puts "This app was written in Ruby from scratch. It was finished in 1 week"
        puts "For more info, please visit https://github.com/kimbstocker/KimStocker_T1A3"
        exit
    when '-r' 
        if rest[1] == '1' || rest[1] == '2' || rest[1] == '3'
        quiz = Quiz.new(rest[0], rest[1])
            quiz.run_quiz
        end
    else 
        puts "Invalid argument, please check Readme file for more info"
        exit 
    end
end 


while true
    begin
        puts "Welcome to Mad Math Quiz! Let's get started with a username, enter anything and it will be your username for this application!"
        username = gets.chomp.downcase
        puts "Please enter 1 for easy, 2 for medium, 3 for hard level, 'q' to quit!"
        puts "(You can also enter 'q' to quit at anytime during the Quiz!)"
        user_choice = gets.chomp
        if user_choice == "q"
            exit_message
        elsif user_choice == "1" || user_choice == "2" || user_choice == "3"
            scoreboard = Scoreboard.new("scoreboard/scoreboard.json")
            scoreboard.read_file
            
            quiz = Quiz.new(username, user_choice, scoreboard)
            quiz.run_quiz
            
            scoreboard.update_score(username, quiz.total_score)
            scoreboard.write_file
        else
            raise ValidationError.new("*** Please enter 1, 2, 3 or q only ***")
        end

    rescue ValidationError => e
        puts e.message 
        retry 
    end
end



 



