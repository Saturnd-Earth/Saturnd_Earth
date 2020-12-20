class Like < ApplicationRecord
  validates_presence_of :latitude, require: true
  validates_presence_of :longitude, require: true
  belongs_to :user
  belongs_to :post
end
