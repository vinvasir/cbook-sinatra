class BookGenre < ActiveRecord::Base
  belongs_to :comic_book
  belongs_to :genre
end