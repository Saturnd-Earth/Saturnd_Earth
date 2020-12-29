class Mutations::CreateUser < Mutations::BaseMutation
    argument :username, String, required: true
    argument :password_digest, Float, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(username:, password_digest:)
        user = User.new(username: username, password_digest: password_digest)
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