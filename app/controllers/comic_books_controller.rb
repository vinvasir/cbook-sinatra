class ComicBooksController < ApplicationController
  get '/comic_books' do
    @cbs = ComicBook.all
    erb :'/comic_books/index'
  end
  
  get '/comic_books/new' do
    erb :'/comic_books/new'
  end
end