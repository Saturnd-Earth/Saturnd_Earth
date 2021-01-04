require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "EditUser", type: :request do
      describe '.resolve' do
        it 'edits a username' do
          user = create(:user, password: "password")
          
          newName = "Edited Name"
          post '/graphql', params: { query: editUser(id: user.id, newName: newName) }
        end
      end
    
      def editUser(id:, newName:)
        <<~GQL
        mutation {
          editUser(input:{
            id: #{id}
            newName: #{newName}
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