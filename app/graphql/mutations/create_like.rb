module Mutations
  class CreateLike < BaseMutation
    argument :user_id, Integer, required: true
    argument :post_id, Integer, required: true
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true

    field :like, Types::LikeType, null: false
    field :errors, [String], null: false

    def resolve(user_id:, post_id:, latitude:, longitude:)
      like = Like.new(user_id: user_id, post_id: post_id, latitude: latitude, longitude: longitude)
      if like.save
          {
              like: like,
              errors: []
          }
      else
          {
              like: nil,
              errors: like.errors.full_messages
          }
      end
    end
  end
end
