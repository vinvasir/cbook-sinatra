class ReviewsController < ApplicationController
  post '/reviews/:comic_book_id' do
    if session[:user_id]
      @comic_book = ComicBook.find(params[:comic_book_id])
      @comic_book.reviews.create(content: params["content"], 
                                  rating: params["rating"],
                                  user_id: params["user_id"])
      redirect "/comic_books/#{@comic_book.id}"
    else
      redirect '/login'
    end
  end    
end