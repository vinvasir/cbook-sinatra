class Review < ActiveRecord::Base
  belongs_to :comic_book
  belongs_to :user
end