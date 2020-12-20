require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :post}
  end

  describe "validations" do
    it {should validate_presence_of :latitude}
    it {should validate_presence_of :longitude}
  end

  describe "creation" do
    it "can create a like" do
      user1 = User.create!(username: "johndoe", password: "123", password_confirmation: '123')
      user2 = User.create!(username: "bobbybones", password: "123", password_confirmation: '123')
      post = Post.create!(user_id: user1.id, content: "Insert funny joke here.", latitude: 40.3456, longitude: -120.2345)
      like = Like.create!(user_id: user2.id, post_id: post.id, latitude: 40.111, longitude: -130.444)
      expect(user1.posts).to eq([post])
      expect(user1.likes).to eq([])
      expect(user1.liked_posts).to eq([])
      expect(user2.likes).to eq([like])
      expect(user2.liked_posts).to eq([post])
      expect(post.likes).to eq([like])
      expect(post.liking_users).to eq([user2])
    end
  end
end