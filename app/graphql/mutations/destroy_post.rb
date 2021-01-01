module Mutations
  class DestroyPost < BaseMutation
    argument :id, ID, required: true

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(id: nil)
      Post.find(id).destroy
    end
  end
end