class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates :text, :uniqueness => true, :presence => true
end
