require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "CreateUser", type: :request do
      describe '.resolve' do
        it 'creates a user' do
          user = create(:user, password: "password")

          expect do
            post '/graphql', params: { query: query(username: user.username) }
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          user = create(:user, password: "password")

          post '/graphql', params: { query: query(username: user.username) }
          json = JSON.parse(response.body)
          data = json['data']['createUser']['user']

          expect(data).to include(
            'id'              => be_present,
            'username'        => "Radoslav Stankov",
            )
          end
      end

      def query(username:)
        <<~GQL
        mutation {
          createUser(input:{
            username: "Radoslav Stankov"
            password: "password123"
          })
          {
            user{
              id
              username
            }
          }
        }
        GQL
      end
    end
  end
end
