require 'rails_helper'

describe Game do
  let(:winner) { FactoryGirl.create(:player) }
  let(:loser) { FactoryGirl.create(:player) }

  it 'should have a valid factory' do
    game = FactoryGirl.create(:game, winner: winner, winner_score: 200, loser: loser, loser_score: 100)

    expect(game).to be_valid
  end

  it 'should require a winner' do
    game = FactoryGirl.build(:game, winner_score: 200, loser: loser, loser_score: 100)

    expect(game).to_not be_valid
  end

  it 'should require a loser' do
    game = FactoryGirl.build(:game, winner_score: 200, winner: winner, loser_score: 100)

    expect(game).to_not be_valid
  end

  it 'should validate numericality of winner score' do
    game = FactoryGirl.build(:game, winner: winner, winner_score: 'foo', loser: loser, loser_score: 100)

    expect(game).to_not be_valid
  end

  it 'should validate numericality of loser score' do
    game = FactoryGirl.build(:game, winner: winner, winner_score: 100, loser: loser, loser_score: 'bar')

    expect(game).to_not be_valid
  end

  it 'should provider player names' do
    game = FactoryGirl.create(:game, winner: winner, winner_score: 200, loser: loser, loser_score: 100)

    expect(game.winner_name).to eq winner.name
    expect(game.loser_name).to eq loser.name
  end

  it 'should set default bingos on create' do
    game = FactoryGirl.create(:game, winner: winner, winner_score: 100, loser: loser, loser_score: 90)

    expect(game.bingos).to eq 0
  end

  it 'should validate that the winner score is greater than the loser score' do
    game = FactoryGirl.build(:game, winner: winner, winner_score: 100, loser: loser, loser_score: 101)

    expect(game).to_not be_valid
  end
end
