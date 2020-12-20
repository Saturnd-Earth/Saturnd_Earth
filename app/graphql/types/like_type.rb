module Types
  class LikeType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :post_id, Integer, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
