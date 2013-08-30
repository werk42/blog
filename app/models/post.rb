class Post < ActiveRecord::Base
	attr_accessible :title, :body, :tags
  
  has_many :taggings
  has_many :tags, :through => :taggings
end
