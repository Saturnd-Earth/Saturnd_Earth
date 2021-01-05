require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe CreatePost, type: :request do
      describe '.resolve' do
        it 'creates a post' do
          user = create(:user)
          expect do
            post '/graphql', params: { query: query(user_id: user.id) }
          end.to change { Post.count }.by(1)
        end

        it 'returns a post' do
          user = create(:user)

          post '/graphql', params: { query: query(user_id: user.id) }
          json = JSON.parse(response.body)
          data = json['data']['createPost']['post']
   
          expect(data).to include(
            'id'              => be_present,
            'content'         => 'Testy testy test',
            'latitude'        => 39.6930795,
            'longitude'       => -104.8897193,
            'createdAt'       => be_present,
            'userId'          => user.id,
            'ringMinMax'      => "[0, 1]"
          )
        end

      end

      def query(user_id:)
        <<~GQL
          mutation {
            createPost(input:
              {
                userId: #{user_id},
                content: "Testy testy test",
                latitude: 39.6930795,
                longitude: -104.8897193
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