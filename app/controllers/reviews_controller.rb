class ReviewsController < ApplicationController
  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    if @review.user_id == session[:user_id]
      erb :'/reviews/edit'
    else
      flash[:error] = "This review isn't yours to edit!"
      redirect "/comic_books/#{@review.comic_book_id}"      
    end
  end
  
  post '/reviews/:comic_book_id' do
    if session[:user_id]
      @comic_book = ComicBook.find(params[:comic_book_id])
      review = @comic_book.reviews.new(content: params["content"], 
                                  rating: params["rating"],
                                  user_id: params["user_id"])
      if review.save
        flash[:error] = "Successfully added review."
        redirect "/comic_books/#{@comic_book.id}"
      else
        flash[:error] = "Please enter both a review and rating."
        redirect "/comic_books/#{@comic_book.id}"
      end
    else
      flash[:error] = "You need to be logged in to add a review!"
      redirect '/login'
    end
  end
  
  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    if @review.user_id == session[:user_id]
      @review.update(content: params["content"], rating: params["rating"])
      redirect "/comic_books/#{@review.comic_book_id}"
    else
      flash[:error] = "This review isn't yours to edit!"
      redirect "/comic_books/#{@review.comic_book_id}"
    end
  end
end