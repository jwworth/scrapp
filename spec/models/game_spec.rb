require 'rails_helper'

describe Game do

  it 'should have a valid factory' do
    winner = FactoryGirl.create(:player)
    loser = FactoryGirl.create(:player)
    game = FactoryGirl.create(:game, winner: winner, winner_score: 200, loser: loser, loser_score: 100)

    expect(game).to be_valid
  end

  it 'should require a winner' do
    loser = FactoryGirl.create(:player)
    game = FactoryGirl.build(:game, winner_score: 200, loser: loser, loser_score: 100)

    expect(game).to_not be_valid
  end

  # TODO Finish validations
end
