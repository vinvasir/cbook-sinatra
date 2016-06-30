class Review < ActiveRecord::Base
  belongs_to :comic_book
  belongs_to :user
  validates_presence_of :content, :rating
end