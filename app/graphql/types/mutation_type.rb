module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :destroy_user, mutation: Mutations::DestroyUser
    field :edit_user, mutation: Mutations::EditUser
    
  end
end
