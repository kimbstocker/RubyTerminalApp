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


    it 'should provide the max score' do
        scoreboard = Scoreboard.new('dummyfilepath')
        scoreboard.update_score("josh", 2)
        scoreboard.max_score
        expect(scoreboard.max_score).to eq(2)
        scoreboard.update_score("kim", 5)
        scoreboard.max_score
        expect(scoreboard.max_score).to eq(5)


    end

end
