require 'rails_helper'

RSpec.describe Player, type: :model do

  ### VALIDATIONS
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should allow_value('foobar').for(:name) }
  it { should_not allow_value('a' * 16).for(:name) }

end
