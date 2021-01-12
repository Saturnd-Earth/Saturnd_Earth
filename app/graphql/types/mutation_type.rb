module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_like, mutation: Mutations::CreateLike
    field :destroy_like, mutation: Mutations::DestroyLike
    field :create_post, mutation: Mutations::CreatePost
    field :edit_post, mutation: Mutations::EditPost
    field :destroy_post, mutation: Mutations::DestroyPost
    field :destroy_user, mutation: Mutations::DestroyUser
    field :edit_user, mutation: Mutations::EditUser
    field :signin_user, mutation: Mutations::SignInUser
  end
end
