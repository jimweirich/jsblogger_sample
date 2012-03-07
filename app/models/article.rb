class Article < ActiveRecord::Base

  has_many :comments, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :body
  validates_length_of :title, :in => (3..20)

end
