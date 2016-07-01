class ComicBooksController < ApplicationController
  get '/comic_books' do
    @cbs = ComicBook.all
    erb :'/comic_books/index'
  end
  
  get '/comic_books/new' do
    erb :'/comic_books/new'
  end
  
  get '/comic_books/:id' do
    @comic_book = ComicBook.find(params[:id])
    erb :'/comic_books/show'
  end
  
  get '/comic_books/:id/edit' do
    @comic_book = ComicBook.find(params[:id])
    if session[:user_id]
      erb :'/comic_books/edit'
    else
      flash[:error] = "You must be logged in to edit a comic"
    end
  end  
  
  post '/comic_books' do
    author = Author.find_or_create_by(name: params["author"])
    artist = Artist.find_or_create_by(name: params["artist"])
    if session[:user_id]
      @comic_book = ComicBook.new(title: params["title"], 
                                    description: params["description"],
                                    author: author,
                                    artist: artist,
                                    genre_ids: params["genres"])
      if @comic_book.save
        redirect "/comic_books/#{@comic_book.id}"
      else
        flash[:error] = "Please fill out all fields!"
        redirect "/comic_books/new"
      end
    else
      flash[:error] = "Please log in to post a comic book"
      redirect '/login'
    end
  end
  
  patch '/comic_books/:id' do
    @comic_book = ComicBook.find(params[:id])
    if session[:user_id]
      @comic_book.update(title: params["title"], description: params["description"])
      author = Author.find_or_create_by(name: params["author"]) unless params["author"].blank?
      artist = Artist.find_or_create_by(name: params["artist"]) unless params["artist"].blank?
      @comic_book.update_attribute(:author, author) unless params["author"].blank?
      @comic_book.update_attribute(:genre_ids, params["genres"])
      redirect "/comic_books/#{@comic_book.id}"
    else
      flash[:error] = "You must be logged in to edit a comic"
      redirect "/login"
    end
  end
end