require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "DestroyUser", type: :request do
      describe '.resolve' do
        it 'deletes a user' do
          user = create(:user, password: "password")
          # Creates a user here
          expect do
            post '/graphql', params: { query: createUser(username: "New User") }
          end.to change { User.count }.by(1)
          expect(User.count).to eq(2)
          
          #Delete created user here
          post '/graphql', params: { query: destroyUser(id: user.id) }
          expect(User.count).to eq(1)
        end
      end
    
      def createUser(username:)
        <<~GQL
        mutation {
          createUser(input:{
            username: "me@gmail.com"
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
