module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :user, Types::UserType, null: true
    field :errors, String, null: false
    
    def resolve(credentials:)
      # return unless credentials

      user = User.find_by username: credentials[:username]
      if user.authenticate(credentials[:password])
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: "Invalid login credentials"
        }
      end
    end
  end
end



# binding.pry
# if !user.nil?
#   return unless user
#   return unless user.authenticate(credentials[:password])
