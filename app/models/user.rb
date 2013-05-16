class User < ActiveRecord::Base
  has_many :posts
  validates :email, :uniqueness => true, :presence => true
end
