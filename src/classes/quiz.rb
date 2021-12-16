require 'json'
require 'colorize'
require 'terminal-table'
require_relative './error-handling.rb'
require_relative '../methods.rb'


OPERATORS = ["+", "-", "*"]
SINGLE_DIGIT_NUMBERS = (1..9).to_a
DOUBLE_DIGIT_NUMBERS = (10..99).to_a
TRIPLE_DIGIT_NUMBERS = (100..999).to_a

class Scoreboard

    attr_accessor :scores

    def initialize(filename)
        @filename = filename
        @all_user_scores = {}
    end
    
    def read_file
        file = File.read(@filename)
        @all_user_scores = JSON.parse(file)
    end

    def max_score
        @all_user_scores.values.max || 0
    end

    def update_score(username, score)
        # update scoreboard if username is new or username total score is higher than history scores.
        if @all_user_scores[username] == nil || @all_user_scores[username] < score
            @all_user_scores[username] = score
        end
    end

    def write_file
        File.write(@filename, JSON.dump(@all_user_scores))
    end
end

class Quiz

    attr_accessor :correct_answers
    attr_accessor :user_answers
    attr_accessor :total_score
    attr_accessor :username

    def initialize(username, level, scoreboard)
        @username = username
        @level = level
        @questions = []
        @correct_answers = []
        @user_answers = []
        @total_score = 0
        @scoreboard = scoreboard
    end

    def run_quiz
        ask_questions
        create_scorecard
        display_scorecard
        save_scorecard
    end

    def ask_questions
        10.times do
            single_digit_num_one = SINGLE_DIGIT_NUMBERS.sample
            single_digit_num_two = SINGLE_DIGIT_NUMBERS.sample
            double_digit_num_one = DOUBLE_DIGIT_NUMBERS.sample
            double_digit_num_two = DOUBLE_DIGIT_NUMBERS.sample
            triple_digit_num = TRIPLE_DIGIT_NUMBERS.sample
            first_operator = OPERATORS.sample
            second_operator = OPERATORS.sample
            third_operator = OPERATORS.sample
            case @level
                when "1"
                    random_numbers = [single_digit_num_one, single_digit_num_two, double_digit_num_one].shuffle
                    question = "#{random_numbers[0]} #{first_operator} #{random_numbers[1]} #{second_operator} #{random_numbers[2]}"
                    
                when "2"
                    random_numbers = [single_digit_num_one, double_digit_num_one, double_digit_num_two].shuffle
                    question = "#{random_numbers[0]} #{first_operator} #{random_numbers[1]} #{second_operator} #{random_numbers[2]}"
                when "3"
                    random_numbers = [single_digit_num_one, double_digit_num_one, double_digit_num_two, triple_digit_num].shuffle
                    question = "#{random_numbers[0]} #{first_operator} #{random_numbers[1]} #{second_operator} #{random_numbers[2]} #{third_operator} #{random_numbers[3]}"
            end

            answer = eval(question)
            @questions << question
            @correct_answers << answer
            puts question
            input = gets.chomp
            if input == 'q'
                exit_message
            elsif input.to_i == answer
                puts "Right".green
            else
                puts "Wrong".red
            end
            @user_answers << input.to_i
        end
       
    end


    def create_scorecard
        @score_to_save = []
        @score_to_display = []
        (0...@user_answers.length).each do |i|
            user_answer_colorized = ""
            if @user_answers[i] == @correct_answers[i]
                score = 1
                user_answer_colorized = "#{@user_answers[i]}".green
            else 
                score = 0
                user_answer_colorized = "#{@user_answers[i]}".red
            end
            row_to_save = ["#{i+1}", "#{@questions[i]}", "#{@correct_answers[i]}", "#{@user_answers[i]}", "#{score}"]
            row_to_display = ["#{i+1}", "#{@questions[i]}", "#{@correct_answers[i]}", user_answer_colorized, "#{score}"]
            @score_to_save << row_to_save
            @score_to_display << row_to_display
            @total_score += score  
        end
    end

    def display_scorecard
        @score_to_display << ["", "", "", "Total Score", @total_score]
        display_table = Terminal::Table.new :title => "Scorecard", :headings => ['No.','Question', 'Correct Answer','Your Answer', 'Your Score'], :rows => @score_to_display
        display_table.align_column(2, :right)
        display_table.align_column(3, :right)
        display_table.align_column(4, :right)
        puts display_table
        if @total_score == 10
            nick_name = ["genius", "mastermind", "math master", "mad math", "you're gifted", "superstar"]
            random_nick_name = nick_name.shuffle
            puts "#{@username.capitalize}, #{random_nick_name[0]}! You got a perfect score!".white.on_blue.blink
        end
        if @total_score >= @scoreboard.max_score
            puts "Congratulations #{@username.capitalize}! You are currently on top of the leaderboard! Great work!".colorize(:magenta).on_light_white.underline     
        end
    end

    
    def save_scorecard
        @score_to_save << ["", "", "", "Total Score", @total_score]
        @save_table = Terminal::Table.new :title => "Scorecard", :headings => ['No.','Question', 'Correct Answer','Your Answer', 'Your Score'], :rows => @score_to_save
        @save_table.align_column(2, :right)
        @save_table.align_column(3, :right)
        @save_table.align_column(4, :right)
        begin
            puts "Would you like to save your scorecard? (Please enter 'yes' to save file, 'no' to start another quiz, or 'q' to quit.)"
            input = gets.chomp
            case input 
                when 'yes'
                    puts "What do you want to name your file?"
                    file_name = gets.chomp
                    File.open("./scorecards/#{file_name} - #{Time.now.utc}.txt", "w+") do |f| 
                        f.puts(@save_table)
                    end 
                    puts "Your scorecard has been saved and here is the file path ./scorecards/#{file_name} - #{Time.now.utc}.txt"
                    puts "Would you like to start another Quiz?(Enter anything to continue, 'no' to exit)"
                    continue = gets.chomp
                    if continue == 'no'
                    exit_message
                    end
                when 'no'
                    return true
                when 'q'
                    exit_message
                else
                    raise ValidationError.new("*** Please enter 'yes', 'no', or 'q' only ***")

            end
        rescue ValidationError => e
            puts e.message 
            retry 
        end
    end

end



