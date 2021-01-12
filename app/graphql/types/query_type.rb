module Types
  class QueryType < Types::BaseObject

    field :likes, [LikeType], null: false

    def likes
      Like.all
    end

    field :like, LikeType, null: false do
      argument :id, ID, required: true
    end

    def like(id:)
      Like.find(id)
    end

    field :users, [UserType], null: false

    def users
      User.all
    end

    field :user, UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :posts, [PostType], null: false

    def posts
      Post.all
    end

    field :post, PostType, null: false do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    field :posts_by_user, [PostType], null: false do
      argument :user_id, Integer, required: true
    end

    def posts_by_user(user_id:)
      User.find(user_id).posts
    end

    field :posts_user_can_increase, [PostType], null: false do
      argument :latitude, Float, required: true
      argument :longitude, Float, required: true
    end

    def posts_user_can_increase(latitude:, longitude:)
      Post.user_can_increase(latitude, longitude)
    end
  end
end
