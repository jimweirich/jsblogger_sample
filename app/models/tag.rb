class Tag < ActiveRecord::Base

  has_many :taggings, :dependent => :destroy
  has_many :articles, :through => :taggings

  validates_presence_of :name

end
