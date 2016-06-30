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
  
  post '/comic_books' do
    @comic_book = ComicBook.create(params)
    redirect "/comic_books/#{@comic_book.id}"
  end
end