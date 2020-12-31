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
  end
end
