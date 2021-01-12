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
                              query: create_user(credentials: {
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
                            query: create_user(credentials: {
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
      end

      def create_user(credentials:)
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
    end
  end
end
