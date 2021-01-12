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

        it 'can get a post' do
          user1 = create(:user)
          user2 = create(:user)
          user3 = create(:user)
          post '/graphql', params: { query: user_by_id(user_id: user1.id) }
          json = JSON.parse(response.body)
          data = json['data']['user']
          expect(data['id']).to eq(user1.id.to_s)
          expect(data['username']).to eq(user1.username)
        end

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

      def user_by_id(user_id:)
        <<~GQL
          {
            user(id: #{user_id}) {
              id
              username
            }
          }
        GQL
      end
      end
    end
  end
end
