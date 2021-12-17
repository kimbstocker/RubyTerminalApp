require_relative '../classes/quiz.rb'

describe 'Scoreboard' do

    it 'should update the score of an existing user if new score is higher than history one' do
        scoreboard = Scoreboard.new('dummyfilepath')
        scoreboard.update_score("josh", 5)
        expect(scoreboard.all_user_scores["josh"]).to eq(5)
        scoreboard.update_score("josh", 6)
        expect(scoreboard.all_user_scores["josh"]).to eq(6)
        scoreboard.update_score("josh", 1)
        expect(scoreboard.all_user_scores["josh"]).to eq(6)
    end


    # it 'should write to scoreboard file when an user finish the Quiz' do
    #     scoreboard = Scoreboard.new(../scoreboard/test_scoreboard.json)
    #     scoreboard.write_file
    #     expect(JSON.parse(../scoreboard/test_scoreboard.json)).to eq(scoreboard.scores)
    
    
    # end


end
