require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe EditPost, type: :request do
      describe '.resolve' do
        it 'edits a post' do
          new_user = create(:user, id: 40)
          new_post = create(:post, user_id: 40, text: "He's left and right handed", post_type: "Comment")
          expect(Post.first.text).to eq("He's left and right handed")
          post '/graphql', params: { query: query(post_id: new_post.id) }
          json = JSON.parse(response.body)
          data = json['data']['editPost']['post']
          expect(Post.first.text).to eq("Jk, he's only right-handed")
        end

      end

      def query(post_id:)
        <<~GQL
        mutation{
          editPost(input:{
            id: #{post_id},
            text: "Jk, he's only right-handed",
            latitude: 71.835532572575,
            longitude: -118.50910685764141,
            userId: 40
          })
          {
            post {
              id
              text
            }
          }
        }
        GQL
      end
    end
  end
end

