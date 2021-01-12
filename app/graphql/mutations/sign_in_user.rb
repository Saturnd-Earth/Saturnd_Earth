module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :user, Types::UserType, null: true

    def resolve(credentials:)
      return unless credentials

      user = User.find_by username: credentials[:username]

      return unless user
      return unless user.authenticate(credentials[:password])

      { user: user}
    end
  end
end
