module Mutations
  class DestroyUser < BaseMutation
    argument :id, ID, required: false
    
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    
    def resolve(id: nil)
      User.find(id).destroy

          {
            errors: []
          }

    end
  end
end