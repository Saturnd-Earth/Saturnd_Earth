require 'rails_helper'

module Queries
  module Posts
    RSpec.describe Posts, type: :request do
      describe '.resolve' do

        it 'can get all posts' do
          user1 = create(:user)
          user2 = create(:user)
          user3 = create(:user)
          post1 = create(:post, user_id: user1.id)
          post2 = create(:post, user_id: user2.id)
          post3 = create(:post, user_id: user3.id)
          post4 = create(:post, user_id: user1.id)
          post5 = create(:post, user_id: user2.id)
          post6 = create(:post, user_id: user3.id)
          post7 = create(:post, user_id: user1.id)
          post8 = create(:post, user_id: user2.id)
          post9 = create(:post, user_id: user3.id)
          post '/graphql', params: { query: all_posts }
          json = JSON.parse(response.body)
          data = json['data']['posts']
          expect(data.count).to eq(9)
          expect(data.first['id']).to eq(post1.id.to_s)
          expect(data.last['id']).to eq(post9.id.to_s)
        end

        it 'can get a post' do
          user1 = create(:user)
          user2 = create(:user)
          user3 = create(:user)
          post1 = create(:post, user_id: user1.id)
          post2 = create(:post, user_id: user2.id)
          post3 = create(:post, user_id: user3.id)
          post4 = create(:post, user_id: user1.id)
          post5 = create(:post, user_id: user2.id)
          post6 = create(:post, user_id: user3.id)
          post7 = create(:post, user_id: user1.id)
          post8 = create(:post, user_id: user2.id)
          post9 = create(:post, user_id: user3.id)
          post '/graphql', params: { query: post_by_id(post_id: post1.id) }
          json = JSON.parse(response.body)
          data = json['data']['post']
          expect(data['id']).to eq(post1.id.to_s)
          expect(data['text']).to eq(post1.text)
        end

        it 'can get all of a users posts' do
          user1 = create(:user)
          user2 = create(:user)
          user3 = create(:user)
          post1 = create(:post, user_id: user1.id)
          post2 = create(:post, user_id: user2.id)
          post3 = create(:post, user_id: user3.id)
          post4 = create(:post, user_id: user1.id)
          post5 = create(:post, user_id: user2.id)
          post6 = create(:post, user_id: user3.id)
          post7 = create(:post, user_id: user1.id)
          post8 = create(:post, user_id: user2.id)
          post9 = create(:post, user_id: user3.id)
          post '/graphql', params: { query: posts_by_user_id(user_id: user1.id) }
          json = JSON.parse(response.body)
          data = json['data']['postsByUser']
          expect(data.count).to eq(3)
          expect(data.first['id']).to eq(post1.id.to_s)
          expect(data[1]['id']).to eq(post4.id.to_s)
          expect(data[2]['id']).to eq(post7.id.to_s)
        end
      end

      def all_posts
        <<~GQL
          {
            posts {
              id
              latitude
              longitude
              ringMinMax
              createdAt
              userId
              text
              url
              likers{
                id
                username
               }
               likes{
                 id
                 userId
                 latitude
                 longitude
                 createdAt
               }
            }
          }
        GQL
      end

      def post_by_id(post_id:)
        <<~GQL
          {
            post(id: #{post_id}) {
              id
              latitude
              longitude
              ringMinMax
              createdAt
              userId
              text
              url
              likers{
                id
                username
               }
               likes{
                 id
                 userId
                 latitude
                 longitude
                 createdAt
               }
            }
          }
        GQL
      end

      def posts_by_user_id(user_id:)
        <<~GQL
          {
            postsByUser(userId: #{user_id}) {
              id
              latitude
              longitude
              ringMinMax
              createdAt
              userId
              text
              url
              likers{
                id
                username
               }
               likes{
                 id
                 userId
                 latitude
                 longitude
                 createdAt
               }
            }
          }
        GQL
      end
    end
  end
end
