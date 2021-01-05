FactoryBot.define do
  factory :post do
    user { nil }
    content { "MyText" }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    min_max { 1 }
  end
end
