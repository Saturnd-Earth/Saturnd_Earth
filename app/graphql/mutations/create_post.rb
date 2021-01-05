module Mutations
  class CreatePost < BaseMutation
    argument :content, String, required: true
    argument :user_id, Integer, required: true
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(content: nil, user_id: nil, latitude: nil, longitude: nil)
      post = Post.new(content: content, user_id: user_id, latitude: latitude, longitude: longitude)
      if post.save 
        {
          post: post,
          errors: []
        }
      else
        {
          post: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end