module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_post, mutation: Mutations::CreatePost
    field :destroy_post, mutation: Mutations::DestroyPost
    field :destroy_user, mutation: Mutations::DestroyUser
    field :edit_user, mutation: Mutations::EditUser
  end
end
