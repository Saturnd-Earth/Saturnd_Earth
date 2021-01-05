require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.email }
    password_digest { "MyString" }
  end
end
