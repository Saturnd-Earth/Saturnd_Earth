module Mutations
  class CreateUser < BaseMutation

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(credentials:)
      user = User.new(
        username: credentials&.[](:username),
        password: credentials&.[](:password)
      )
      if user.save
          {
              user: user,
              errors: []
          }
      else
          {
              user: nil,
              errors: user.errors.full_messages
          }
      end
    end
  end
end
