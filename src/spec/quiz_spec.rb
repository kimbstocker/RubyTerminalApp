require_relative '../classes/quiz.rb'

# describe 'Quiz' do
#     before(:each) do
#         @test_quiz = Quiz.new("test", "1")
#     end

#     after(:all) do
        
#     end

#     # it "should have an array of user answers" do
#     #     expect(@test_quiz.user_answers).to be_an_instance_of(Array)
    
#     # end

#     # it "should ask 10 quiz questions" do 
      
#     #     length = @test_quiz.user_answers.length
#     #     @test_group.run_quiz
#     #     expect(@test_group.user_answers).to eq(10)
#     # end


#     describe ".ask_questions" do 
#         it "should be defined" do 
#             expect(defined? @test_quiz.ask_questions).to eq("method")
#         end
        
#         it "should increase @names_array by one" do 
#             length = @test_group.names_array.length
#             @test_group.add_name("Alex")
#             expect(@test_group.names_array.length).to eq(length + 1)
#         end
        
#         it "should append the input name to the end of @names_array" do 
#             @test_group.add_name("Callum")
#             expect(@test_group.names_array[-1]).to eq("Callum")
#         end 
#     end



# end



# test_json_file = File.read('./scoreboard/test_scoreboard.json')
# @hash_scoreboard = JSON.parse(test_json_file) 


# File.write("./scoreboard/test_scoreboard.json", JSON.dump(@hash_scoreboard))


# it "should have an hash of username and their score" do


# names = ["Kim", "Humpty", "Dumpty", "MoonCow"]
# test_usernames = names.shuffle
# @random_test_username = test_usernames[0]
# levels = ["1", "2", "3"]
# test_levels = levels.shuffle
# random_test_level = test_levels[0]
# @test_quiz.run_quiz


describe 'Quiz' do
    it "should have an username" do
        test_quiz = Quiz.new("Santa", "1")
        expect(test_quiz.username).to eq("Santa")
    end
end