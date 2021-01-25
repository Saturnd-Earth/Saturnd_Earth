module Mutations
  class DestroyUser < BaseMutation
    argument :id, ID, required: false
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    def resolve(id:)
      user = User.find(id)
      user.destroy
          {
            user: user,
            errors: []
          }
    end
  end
end
