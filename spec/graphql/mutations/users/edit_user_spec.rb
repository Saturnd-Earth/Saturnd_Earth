require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "EditUser", type: :request do
      describe '.resolve' do
        it 'edits a username' do
          User.create!(username: "Original", password: "password")
          
          user = User.last
          
          expect(user.username).to eq("Original")
          
          post '/graphql', params: { query: editUser(id: user.id) }
          
          user = User.last
          
          expect(user.username).to eq("testname")

        end
      end
    
      def editUser(id:)
        <<~GQL
        mutation {
          editUser(input:{
            id: #{id}
            username: "testname"
            password: "password"
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