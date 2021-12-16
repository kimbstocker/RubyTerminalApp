require_relative '../classes/quiz.rb'

describe 'Quiz' do
    before(:each) do
        test_usernames = ["Kim", "Humpty", "Dumpty", "MoonCow"]
        @random_test_username = test_usernames.shuffle[0]
        levels = ["1", "2", "3"]
        random_level = levels.shuffle[0]
        @test_quiz = Quiz.new(random_test_username, random_level)
        test_json_file = File.read('./scoreboard/test_scoreboard.json')
        @hash_scoreboard = JSON.parse(test_json_file) 
    end

    after(:all) do
        File.write("./scoreboard/test_scoreboard.json", JSON.dump(@hash_scoreboard))
    end

    










end
