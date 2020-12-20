require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :username}
    it {should validate_presence_of :password}
  end

  describe "relationships" do
    it {should have_many :posts}
    it {should have_many :likes}
    it {should have_many(:liked_posts).through(:likes)}
  end

  describe "creation" do
    it "can create a user" do
      user = User.create!(username: "johndoe", password: "123", password_confirmation: '123')
      expect(user).to be_a(User)
      expect(user.username).to eq("johndoe")
    end
  end

end