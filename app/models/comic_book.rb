class ComicBook < ActiveRecord::Base
  belongs_to :author
  has_many :reviews    
end