class Author < ActiveRecord::Base
  has_many :comic_books
end