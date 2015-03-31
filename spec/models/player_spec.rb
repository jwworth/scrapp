require 'rails_helper'

describe Player do

  it 'should be have a valid factory' do
    player = FactoryGirl.create(:player)

    expect(player).to be_valid
  end

  it 'should validate uniquness of name' do
    player = FactoryGirl.create(:player, name: 'foobar')
    dup_player = FactoryGirl.create(:player, name: 'foobar')

    expect(dup_player).to_not be_valid
  end

  it 'should validate length of name' do
    player = FactoryGirl.build(:player, name: 'a' * 16)

    expect(player).to_not be_valid
  end

  it 'should standardize caplitalization' do
    player = FactoryGirl.create(:player, name: 'foOBar')

    expect(player.name).to eq('Foobar')
  end
end
