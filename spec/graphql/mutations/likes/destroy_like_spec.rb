require 'rails_helper'

module Mutations
  module Likes
    RSpec.describe "DestroyLike", type: :request do
      describe '.resolve' do
        it 'destroys a like' do
          like_user = create(:user, username: "user1@turing.com", password: "password")
          post_user = create(:user, username: "user2@turing.com", password: "password")
          post = create(:post, user: post_user)
          like = create(:like, user_id: like_user.id, post_id: post.id, latitude: 38.8409, longitude:-105.0423)
        
          expect do
            post '/graphql', params: { query: destroyLike(like_id: like.id) }
          end.to change { Like.count }.by(-1)
        end
      end

      def destroyLike(like_id:)
        <<~GQL
          mutation {
            destroyLike(input:
              {
                id: #{like_id},
              }
            )
            {
              like{
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
