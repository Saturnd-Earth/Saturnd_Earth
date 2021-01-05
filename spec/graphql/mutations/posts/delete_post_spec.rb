require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe DestroyPost, type: :request do
      describe '.resolve' do
        it 'destroys a post' do
          user = create(:user)
          post = create(:post, user_id: user.id)
          expect do
            post '/graphql', params: { query: query(post_id: post.id) }
          end.to change { Post.count }.by(-1)
        end
      end

      def query(post_id:)
        <<~GQL
          mutation {
            destroyPost(input:
              {
                id: #{post_id},
              }
            )
            {
              post{
                id,
                content,
                latitude,
                longitude,
                ringMinMax,
                createdAt,
                userId
              }
            }
          }
        GQL
      end
    end
  end
end