module Mutations
  class CreatePost < BaseMutation
    argument :text, String, required: true
    argument :user_id, Integer, required: true
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true
    argument :url, String, required: false
    argument :post_type, String, required: true


    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(text: nil, user_id: nil, latitude: nil, longitude: nil, url: nil, post_type: nil)
      post = Post.new(text: text, user_id: user_id, latitude: latitude, longitude: longitude, url: url, post_type: post_type)
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

# post = Post.create!(content: "content", user_id: 1, latitude: 33.33, longitude: 11.11, url: "url.com", post_type: "Like")
