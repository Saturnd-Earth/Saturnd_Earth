class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post
end
