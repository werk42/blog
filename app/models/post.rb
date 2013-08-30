class Post < ActiveRecord::Base
	attr_accessible :title, :body, :tag_names
  attr_accessor :tag_names
  after_save :assign_tags

  
  has_many :taggings
  has_many :tags, :through => :taggings


  def tag_names
    @tag_names || tags.map(&:name).join(' ') 
  end

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name.strip)
      end
    end
  end
end
