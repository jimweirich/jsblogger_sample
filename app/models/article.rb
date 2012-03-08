class Article < ActiveRecord::Base

  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  validates_presence_of :title
  validates_presence_of :body

  def tag_list
    tags.map { |tag| tag.name }.join(", ")
  end

  def tag_list=(values)
    taggings.clear
    names = values.split(',').map { |name| name.strip }.uniq
    names.each do |name|
      tag = Tag.find_or_create_by_name(name)
      taggings.build(tag: tag)
    end
  end

end
