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
  end
end
