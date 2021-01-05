module Mutations
  class DestroyLike < BaseMutation
    argument :id, ID, required: true

    field :like, Types::LikeType, null: true
    field :errors, [String], null: false

    def resolve(id: nil)
      like = Like.find(id)
      like.destroy
      {
        like: like,
        result: like.errors.blank?
      }
    end
  end
end
