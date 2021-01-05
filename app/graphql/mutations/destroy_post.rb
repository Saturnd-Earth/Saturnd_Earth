module Mutations
  class DestroyPost < BaseMutation
    argument :id, ID, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(id: nil)
      post = Post.find(id)
      post.destroy
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end