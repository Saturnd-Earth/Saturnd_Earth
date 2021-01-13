require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "CreateUser", type: :request do
      describe '.resolve' do
        it 'creates a user' do
          username = "username@email.com"
          password = "123456"
          expect do
            post '/graphql', params: {
                              query: createUser(credentials: {
                                                  username: username,
                                                  password: password
                                                }
                                              )
                                            }
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          username = "username@email.com"
          password = "123456"

          post '/graphql', params: {
                            query: createUser(credentials: {
                                                  username: username,
                                                  password: password
                                                }
                                              )
                                            }
          json = JSON.parse(response.body)
          data = json['data']['createUser']['user']

          expect(data).to include(
            'id'              => be_present,
            'username'        => username
            )
        end
        
        it 'returns an error if either username or password is invalid' do
          username = "username@email.com"
          password = "123456"
          post '/graphql', params: {
                            query: badCreateUser(credentials: {
                                                username: username,
                                                password: password
                                              }
                                            )
                                          }
                                          
          json = JSON.parse(response.body)
          data = json['errors'].first['message']

          expect(data).to eq("Invalid Username or Password")
        end
      end

      def createUser(credentials:)
        <<~GQL
        mutation {
          createUser(input:{
            credentials: {
              username: "#{credentials&.[](:username)}",
              password: "#{credentials&.[](:password)}"
            }
          }
        )
          {
            user{
              id
              username
            }
          }
        }
        GQL
      end
      
      def badCreateUser(credentials:)
        <<~GQL
        mutation {
          createUser(input:{
            credentials: {
              username: "#{credentials&.[](:username)}",
              password: "#{credentials&.[](1)}"
            }
          }
        )
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
