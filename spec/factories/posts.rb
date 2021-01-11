require 'faker'

FactoryBot.define do
  factory :post do
    user { nil }
    text { "MyText" }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    ring_min_max { 1 }
    url { "url.com" }
    post_type { "Link" }
  end
end
