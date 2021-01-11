module Mutations
  class EditPost < Mutations::BaseMutation

    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :text, String, required: false
    argument :user_id, Integer, required: false
    argument :latitude, Float, required: false
    argument :longitude, Float, required: false

    def resolve(**args)
      post = Post.find(args[:id])
      post.update!(text: args[:text], latitude: args[:latitude], longitude: args[:longitude])
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end
