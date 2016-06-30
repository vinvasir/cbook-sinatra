class ComicBooksController < ApplicationController
  get '/comic_books' do
    @cbs = ComicBook.all
    erb :'/comic_books/index'
  end
end