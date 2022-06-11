FactoryBot.define do
  factory :item do
    name  {'はなちゃん'}
    price {300}
    association :user
  end
end
