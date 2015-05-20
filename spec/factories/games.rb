FactoryGirl.define do
  factory :game do
    winner { FactoryGirl.create(:player, name: 'Winner') }
    loser { FactoryGirl.create(:player, name: 'Loser') }
    winner_score 100
    loser_score 80
  end
end
