require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.email }
    password { "MyString" }
  end
end
