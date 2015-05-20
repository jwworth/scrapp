require 'rails_helper'

describe Game do
  it 'should have a valid factory' do
    game = FactoryGirl.create(:game)
    expect(game).to be_valid
  end

  it 'should require a winner' do
    game = FactoryGirl.build(:game, winner: nil)
    expect(game).to_not be_valid
  end

  it 'should require a loser' do
    game = FactoryGirl.build(:game, loser: nil)
    expect(game).to_not be_valid
  end

  it 'should validate numericality of winner score' do
    game = FactoryGirl.build(:game, winner_score: 'foo')
    expect(game).to_not be_valid
  end

  it 'should validate numericality of loser score' do
    game = FactoryGirl.build(:game, loser_score: 'bar')
    expect(game).to_not be_valid
  end

  it 'should provider player names' do
    game = FactoryGirl.create(:game)
    expect(game.winner_name).to eq 'Winner'
    expect(game.loser_name).to eq 'Loser'
  end

  it 'should set default bingos on create' do
    game = FactoryGirl.create(:game)
    expect(game.bingos).to eq 0
  end

  it 'should validate that the winner score is greater than the loser score' do
    game = FactoryGirl.build(:game, winner_score: 100, loser_score: 101)
    expect(game).to_not be_valid
  end
end
