class ReviewsController < ApplicationController
  post '/reviews/:comic_book_id' do
    @comic_book = ComicBook.find(params[:comic_book_id])
    redirect "/comic_books/#{@comic_book.id}"
  end    
end