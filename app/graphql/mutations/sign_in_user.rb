module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: false
    
    def resolve(credentials:)
      # return unless credentials

      user = User.find_by username: credentials[:username]
      binding.pry
      if user.authenticate(credentials[:password]) == true
        {
          user: user,
          errors: []
        }
      elsif user.authenticate(credentials[:password]) == false
        {
          user: nil,
          errors: "user.errors.full_messages"
        }
      end
    end
  end
end



# binding.pry
# if !user.nil?
#   return unless user
#   return unless user.authenticate(credentials[:password])
