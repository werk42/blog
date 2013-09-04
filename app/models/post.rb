class Post < ActiveRecord::Base

  validates :title, :presence true
  validates :body, :presence true

	attr_accessible :title, :body, :tag_names
  attr_accessor :tag_names
  after_save :assign_tags

  
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def self.tagged(name)
    Tag.find_by_name!(name).posts
  end

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
