FactoryBot.define do
  factory :post do
    user { nil }
    content { "MyText" }
    latitude { 1.5 }
    longitude { 1.5 }
    ring_min_max { 1 }
  end
end
