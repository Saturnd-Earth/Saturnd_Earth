module Types
  class LikeType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :post_id, Integer, null: false
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
