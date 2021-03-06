class ComicBook < ActiveRecord::Base
  belongs_to :author
  belongs_to :artist
  has_many :reviews
  has_many :book_genres
  has_many :genres, through: :book_genres
  validates_presence_of :title, :description
end