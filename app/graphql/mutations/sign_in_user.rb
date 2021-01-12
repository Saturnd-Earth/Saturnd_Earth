module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :user, Types::UserType, null: true
    field :errors, String, null: false
        
    def resolve(credentials:)

      user = User.find_by username: credentials[:username]
      if user.authenticate(credentials[:password])
        {
          user: user,
          errors: []
        }
      else
        GraphQL::ExecutionError.new("Invalid Credentials")
      end
    end
    
  end
end