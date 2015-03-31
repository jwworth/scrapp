FactoryGirl.define do
  factory :player do
    sequence :name do |n|
      "user#{n}"
    end
  end
end
