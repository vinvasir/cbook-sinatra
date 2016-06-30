class Genre < ActiveRecord::Base
  has_many :book_genres
  has_many :comic_books, through: :book_genres
  validates_presence_of :name  
end