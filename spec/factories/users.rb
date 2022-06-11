FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'a12345' }
    password_confirmation { password }
    family_name           { Faker::Name.initials(number: 2) }
  end
end
