FactoryBot.define do
  factory :member do
    name  { Faker::Name.initials(number: 2) }
    fixed { 300 }
    color { '#ffb2b9' }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

  end
end
