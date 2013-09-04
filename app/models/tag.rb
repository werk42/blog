class Tag < ActiveRecord::Base

  validates :name, :presence true

  attr_accessible :name

  has_many :taggings
  has_many :posts, through: :taggings

end
