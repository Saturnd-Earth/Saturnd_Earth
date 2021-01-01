module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :content, String, null: false
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    field :ring_min_max, String, null: false
    field :created_at, String, null: false
  end
end
