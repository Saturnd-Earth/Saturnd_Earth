FactoryBot.define do
  factory :user do
    username { "New User" }
    password_digest { "MyString" }
  end
end
