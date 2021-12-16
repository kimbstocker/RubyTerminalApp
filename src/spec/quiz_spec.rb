require_relative '../classes/quiz.rb'


describe 'Quiz' do
    it "should have an username" do
        test_quiz = Quiz.new("Santa", "1")
        expect(test_quiz.username).to eq("Santa")
    end


    
end



# it should check if it gives the user the correct score
# it should check if it tally up the user score correctly