class User < ActiveRecord::Base
  has_secure_password
  has_many :followers, :class_name => 'Followers', :foreign_key => 'follower_id'
  has_many :following, :class_name => 'Followers', :foreign_key => 'user_id'
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :handle, presence: true
  validates :email, presence: true
end
