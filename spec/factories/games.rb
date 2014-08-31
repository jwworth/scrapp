# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    winner 1
    winner_score 1
    loser 1
    loser_score 1
    bingos 1
  end
end
