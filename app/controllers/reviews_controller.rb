class ReviewsController < ApplicationController
  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    erb :'/reviews/edit'
  end
  
  post '/reviews/:comic_book_id' do
    if session[:user_id]
      @comic_book = ComicBook.find(params[:comic_book_id])
      review = @comic_book.reviews.new(content: params["content"], 
                                  rating: params["rating"],
                                  user_id: params["user_id"])
      if review.save
        flash[:message] = "Successfully added review."
        redirect "/comic_books/#{@comic_book.id}"
      else
        flash[:message] = "Please enter both a review and rating."
        redirect "/comic_books/#{@comic_book.id}"
      end
    else
      flash[:message] = "You need to be logged in to add a review!"
      redirect '/login'
    end
  end    
end