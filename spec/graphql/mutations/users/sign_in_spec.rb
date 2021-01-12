require 'rails_helper'

module Mutations
  module Users
    RSpec.describe "SignInUser", type: :request do
      describe '.resolve' do
        before(:each) do
          @user = User.create(username: "username@email.com", password: "123456")
        end
        
        it 'signs in a user' do

          post '/graphql', params: {
                            query: sign_in_user(credentials: {
                                                username: @user.username,
                                                password: @user.password
                                              }
                                            )
                                          }
        
          json = JSON.parse(response.body)
          data = json['data']['signinUser']['user']
        
          expect(data).to include(
            'id'              => be_present,
            'username'        => @user.username
            )
        end
        
        it 'returns and error if signin credentials are incorrect' do

          post '/graphql', params: {
                            query: sign_in_user(credentials: {
                                                username: @user.username,
                                                password: "Wrong Password"
                                              }
                                            )
                                          }
        
          json = JSON.parse(response.body)
          data = json['errors'].first['message']
          
          expect(data).to eq("Invalid Credentials")
        end
        
      end

        def sign_in_user(credentials:)
          <<~GQL
          mutation {
            signinUser(input:{
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
