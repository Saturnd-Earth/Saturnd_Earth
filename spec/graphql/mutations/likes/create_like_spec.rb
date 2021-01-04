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
            post '/graphql', params: { query: create_like(user_id: 88, post_id: 15, latitude: 80.765849, longitude: -92.87357) }
          end.to change { Like.count }.by(1)
        end
      end

      def create_like(user_id:, post_id:, latitude:, longitude:)
        <<~GQL
          mutation {
            createLike(input:{
              user_id: 88
              post_id: 15
              latitude: 80.765849
              longitude: -92.87357}
            )
          }
        GQL
      end
    end
  end
end