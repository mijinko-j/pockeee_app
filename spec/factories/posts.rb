FactoryBot.define do
  factory :post do
    day { 2020/01/01 }
    association :item
    association :user
    association :member
  end
end
