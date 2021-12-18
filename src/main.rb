require 'colorize'
require "tty-prompt"
require_relative './classes/quiz.rb'
require_relative './classes/error-handling.rb'
require_relative './methods.rb'


if ARGV.length > 0 
    flag, *rest = ARGV 
    ARGV.clear
    case flag
    when '-help'
        puts "-info                    :to view history of the app and developer information"
        exit
    when '-info'
        puts "This terminal application namely 'Mad Math Quiz' is written by Kim Stocker in December - 2021 for CoderAcademy Full-stack Developer Course - Term 1 assignment"
        puts "This app was written in Ruby from scratch. It was finished in 1 week"
        puts "For more info, please visit https://github.com/kimbstocker/KimStocker_T1A3"
        exit
    else 
        puts "Invalid argument, please check Readme file for more info"
        exit 
    end
end 


while true
    puts "                     *** Disclaimer ***".red
    puts "Your score will be stored in the system at the end of the Quiz.".red
    puts "User a nickname or quit at anytime if you dont want your details to be stored".red
    puts "You can enter 'q' to quit at anytime during the Quiz!".red
    puts "                     *** Disclaimer ***".red
    prompt = TTY::Prompt.new
    level_choices = {Easy: "1", Medium: "2", Hard: "3", Quit: "q"}
    user_choice = prompt.select("Welcome to Mad Math Quiz! Please choose your difficulty level?", level_choices)
    if user_choice == "q"
        exit_message
    elsif user_choice == "1" || user_choice == "2" || user_choice == "3"
        scoreboard = Scoreboard.new("scoreboard/scoreboard#{user_choice}.json")
        scoreboard.read_file
        begin
            puts "Let's get started, please enter a username. If you have played this quiz before you can use the same username and only your highest score will be saved at the end of the game.".magenta
            username = gets.chomp.downcase
            if scoreboard.all_user_scores.has_key?(username)
                puts "This username has already been taken, is it yours? Please enter 'yes' to continue playing with this username, 'no' to go back to choose another one."
                return_user = gets.chomp.downcase
                if return_user == 'no'
                    raise ValidationError.new("Please enter another username to continue")
                end
            end
        rescue ValidationError => e
            puts e.message.red
            retry
        end
        puts "*** Welcome to Mad Math Quiz - Level: #{user_choice} - Username: #{username.capitalize} ***".light_blue
        quiz = Quiz.new(username, user_choice, scoreboard)
        quiz.run_quiz

        scoreboard.update_score(username, quiz.total_score)
        scoreboard.write_file

        quiz.save_scorecard
    end
end



 



