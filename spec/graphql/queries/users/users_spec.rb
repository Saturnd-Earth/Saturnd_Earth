require 'rails_helper'

module Queries
  module Users
    RSpec.describe Users, type: :request do
      describe '.resolve' do

        it 'can get all users' do
          user1 = create(:user)
          user2 = create(:user)
          user3 = create(:user)
          post '/graphql', params: { query: all_users }
          json = JSON.parse(response.body)
          data = json['data']['users']
          expect(data.count).to eq(3)
          expect(data.first['id']).to eq(user1.id.to_s)
          expect(data.last['id']).to eq(user3.id.to_s)
        end

        # it 'can get a post' do
        #   user1 = create(:user)
        #   user2 = create(:user)
        #   user3 = create(:user)
        #   post1 = create(:post, user_id: user1.id)
        #   post2 = create(:post, user_id: user2.id)
        #   post3 = create(:post, user_id: user3.id)
        #   post4 = create(:post, user_id: user1.id)
        #   post5 = create(:post, user_id: user2.id)
        #   post6 = create(:post, user_id: user3.id)
        #   post7 = create(:post, user_id: user1.id)
        #   post8 = create(:post, user_id: user2.id)
        #   post9 = create(:post, user_id: user3.id)
        #   post '/graphql', params: { query: post_by_id(post_id: post1.id) }
        #   json = JSON.parse(response.body)
        #   data = json['data']['post']
        #   expect(data['id']).to eq(post1.id.to_s)
        #   expect(data['text']).to eq(post1.text)
        # end

      def all_users
        <<~GQL
          {
            users {
              id
              username
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
      end
    end
  end
end
