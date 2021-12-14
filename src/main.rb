require 'colorize'
require_relative './classes/quiz.rb'
require_relative './classes/scorecard.rb'

if ARGV.length > 0 
    flag, *rest = ARGV 
    ARGV.clear
    case flag
    when '-help'
        puts "Check the readme"
        exit
    when '-info'
        puts "Written by FX2021-02"
        exit
    when '-path'
        group = Group.new(rest[1] ||= "Default Group", rest[0])
    else 
     puts "Invalid argument, please check documentation"
     exit 
    end
end  


if ARGV.length > 0 
    flag, *rest = ARGV 
    ARGV.clear
    case flag
    when '-help'
        puts "Check the readme"
        exit
    when '-info'
        puts "Written by FX2021-02"
        exit
    when '-path'
        group = Group.new(rest[1] ||= "Default Group", rest[0])
    else 
     puts "Invalid argument, please check documentation"
     exit 
    end
end  



puts "Choose level 1, 2 or 3"
input = gets.chomp.to_i
quiz = Quiz.new(input)
quiz.run_quiz

