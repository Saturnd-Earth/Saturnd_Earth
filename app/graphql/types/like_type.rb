module Types
  class LikeType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :post_id, Integer, null: false
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    field :created_at, String, null: false
  end
end
