require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it {should validate_presence_of :text}
    it {should validate_presence_of :latitude}
    it {should validate_presence_of :longitude}
    it {should validate_presence_of :post_type}
  end

  describe "relationships" do
    it {should belong_to :user}
    it {should have_many :likes}
    it {should have_many(:likers).through(:likes)}
  end

  describe "creation" do
    it "can create a post" do
      user = User.create!(username: "johndoe", password: "123", password_confirmation: '123')
      post = Post.create!(user_id: user.id, text: "Insert funny joke here.", latitude: 40.3456, longitude: -120.2345, post_type: "Comment")
      expect(post).to be_a(Post)
      expect(post.text).to eq("Insert funny joke here.")
      expect(post.latitude).to eq(40.3456)
      expect(post.longitude).to eq(-120.2345)
      expect(post.ring_min_max).to eq([0, 1])
    end
  end

  describe "model methods" do
    it "can increase ring min max" do
      user = User.create!(username: "johndoe", password: "123", password_confirmation: '123')
      post = Post.create!(user_id: user.id, text: "Insert funny joke here.", latitude: 40.3456, longitude: -120.2345, post_type: "Comment")
      expect(post.ring_min_max).to eq([0, 1])
      post.increase_ring
      expect(post.ring_min_max).to eq([1, 2])
      5.times do
        post.increase_ring
      end
      expect(post.ring_min_max).to eq([32, 64])
    end
  end
end
