class Like < ApplicationRecord
  validates_presence_of :latitude, require: true
  validates_presence_of :longitude, require: true
  validates_uniqueness_of :user_id, :scope => [:post_id]
  belongs_to :user
  belongs_to :post

  after_create :check_against_post_ring

  def check_against_post_ring
    distance = Geocoder::Calculations.distance_between([latitude,longitude], [post.latitude,post.longitude])
    post.increase_ring if distance >= post.ring_min_max[0] && distance <= post.ring_min_max[1]
  end
end
