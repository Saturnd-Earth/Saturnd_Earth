class Post < ApplicationRecord
  validates_presence_of :content, require: true
  validates_presence_of :latitude, require: true
  validates_presence_of :longitude, require: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, :through => :likes, :source => :user

  enum ring_min_max: [
    [0, 1], [1, 2], [2, 4], [4,8],
    [8, 16], [16, 32], [32, 64], [64, 128], 
    [128, 256], [256, 512], [512, 1024], 
    [1024, 2000], [2000, 4000], [4000, 6000], 
    [6000, 8000], [8000, 10000], [10000, 12500]
  ]

  def increase_ring
    update_column(:ring_min_max, Post.ring_min_maxes[ring_min_max] + 1)
  end
end