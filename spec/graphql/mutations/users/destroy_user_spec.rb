require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "DestroyUser", type: :request do
      describe '.resolve' do
        it 'deletes a user' do
          user = create(:user, password: "password")

          expect(User.count).to eq(1)
          post '/graphql', params: { query: destroyUser(id: user.id) }
          expect(User.count).to eq(0)

          json = JSON.parse(response.body)
          data = json['data']['destroyUser']['user']
          expect(data).to include('id'=> user.id.to_s)
        end
      end

      def destroyUser(id:)
        <<~GQL
        mutation {
          destroyUser(input:{
            id: #{id}
          })
          {
            user{
              id
            }
          }
        }
        GQL
      end
    end
  end
end
