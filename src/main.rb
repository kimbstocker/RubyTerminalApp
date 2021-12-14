require 'colorize'
require_relative './classes/quiz.rb'

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

puts "Choose level 1, 2 or 3"
input = gets.chomp.to_i
quiz = Quiz.new(input)
quiz.run_quiz

