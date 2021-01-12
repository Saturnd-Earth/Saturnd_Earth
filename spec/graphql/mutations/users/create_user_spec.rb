require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "CreateUser", type: :request do
      describe '.resolve' do
        it 'creates a user' do
          user = create(:user, password: "password")

          expect do
            post '/graphql', params: { query: create_user(username: user.username) }
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          user = create(:user, password: "password")

          post '/graphql', params: { query: create_user(username: user.username) }
          json = JSON.parse(response.body)
          data = json['data']['createUser']['user']

          expect(data).to include(
            'id'              => be_present,
            'username'        => "Radoslav Stankov",
            )
        end
        
        it 'returns a errors if user creation fails' do
          user = create(:user, password: "password")

          post '/graphql', params: { query: create_user(username: user.username) }
          
          json = JSON.parse(response.body)
          data = json['data']['createUser']['user']
          
          expect(data).to include(
            'id'              => be_present,
            'username'        => "Radoslav Stankov",
            )
            
          post '/graphql', params: { query: create_user(username: user.username) }
          
          json = JSON.parse(response.body)
          error_message = json['errors'].first
          
          expect(data).to include(
            'message'              => be_present
            )
          
        end
        
      end

      def create_user(username:)
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
      
      def incorrect_create_user(username:)
        <<~GQL
        mutation {
          createUser(input:{
            username: "Radoslav Stankov"
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
