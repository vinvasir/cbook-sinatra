class AuthorsController < ApplicationController
  get '/authors' do
    @authors = Author.all
    erb :'/authors/index'
  end
  
  get '/authors/new' do
    if session[:user_id]
      erb :'/authors/new'
    else
      flash[:error] = "You have to be logged in to create an author!"
      redirect '/login'
    end
  end
  
  post '/authors' do
    @author = Author.new(params)
    if @author.save
      redirect '/authors'
    else
      flash[:error] = "You must enter an author name!"
      redirect '/authors/new'
    end
  end
end