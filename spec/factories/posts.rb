require 'faker'

FactoryBot.define do
  factory :post do
    user { nil }
    content { "MyText" }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    ring_min_max { 1 }
  end
end
