require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe CreatePost, type: :request do
      describe '.resolve' do
        it 'creates a post' do
          user = create(:user)
          # binding.pry
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
            'text'         => 'Testy testy test',
            'latitude'        => 39.6930795,
            'longitude'       => -104.8897193,
            'createdAt'       => be_present,
            'userId'          => user.id,
            'ringMinMax'      => "[0, 1]",
            'url'             => "url.com",
            'postType'        => "Link"
          )
        end

      end

      def query(user_id:)
        <<~GQL
          mutation {
            createPost(input:
              {
                userId: #{user_id},
                text: "Testy testy test"
                latitude: 39.6930795
                longitude: -104.8897193
                url: "url.com"
                postType: "Link"
              }
            )
            {
              post{
                id,
                text,
                latitude,
                longitude,
                ringMinMax,
                createdAt,
                userId,
                url,
                postType
              }
            }
          }
        GQL
      end
    end
  end
end
