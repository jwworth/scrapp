require 'rails_helper'

RSpec.describe Game, type: :model do

  ### ASSOCIATIONS
  it { should belong_to(:winner) }
  it { should belong_to(:loser) }

  ### VALIDATIONS
  it { should validate_presence_of(:winner_id) }
  it { should validate_presence_of(:winner_score) }
  it { should validate_presence_of(:loser_id) }
  it { should validate_presence_of(:loser_score) }

  it "should have a higher winner score than loser score" do
    game = Game.new(winner_id: 1, winner_score: 100, loser_id: 1, loser_score: 200)
    game.should_not be_valid
  end
end

