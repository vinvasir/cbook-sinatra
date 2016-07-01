class Artist < ActiveRecord::Base
  has_many :comic_books
  validates_presence_of :name  
end