module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_like, mutation: Mutations::CreateLike
    field :destroy_like, mutation: Mutations::DestroyLike
  end
end
