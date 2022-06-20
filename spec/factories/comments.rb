FactoryBot.define do
  factory :comment do
    comment  {'コメント'}
    comment_member {5}
    association :user
    association :member
  end
end
