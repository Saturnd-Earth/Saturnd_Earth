require 'rails_helper'

module Mutations
  module Likes
    RSpec.describe "CreateLike", type: :request do
      describe '.resolve' do
        it 'creates a like' do
          like_user = create(:user, username: "user1@turing.com", password: "password")
          post_user = create(:user, username: "user2@turing.com", password: "password")
          post = create(:post, user: post_user)
          lat = 38.8409
          lon = -105.0423

          expect do
            post '/graphql', params: { query: create_like(user_id: like_user.id, post_id: post.id, latitude: lat, longitude: lon) }
          end.to change { Like.count }.by(1)
        end

        it 'returns "like" data' do
          like_user = create(:user, username: "user1@turing.com", password: "password")
          post_user = create(:user, username: "user2@turing.com", password: "password")
          post = create(:post, user: post_user)
          lat = 38.8409
          lon = -105.0423

          post '/graphql', params: { query: create_like(user_id: like_user.id, post_id: post.id, latitude: lat, longitude: lon) }
          json = JSON.parse(response.body)
          data = json['data']['createLike']['like']

          expect(data).to include(
            'id'        => be_present,
            'userId'    => like_user.id,
            'postId'    => post.id,
            'latitude'  => lat,
            'longitude' => lon
          )
        end
      end

      def create_like(user_id:, post_id:, latitude:, longitude:)
        <<~GQL
          mutation {
            createLike(input:{
              userId: #{user_id}
              postId: #{post_id}
              latitude: #{latitude}
              longitude: #{longitude}})
            { like{
              id
              userId
              postId
              latitude
              longitude
              }
            }
          }
        GQL
      end
    end
  end
end
