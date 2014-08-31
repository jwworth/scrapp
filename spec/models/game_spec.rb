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

end

