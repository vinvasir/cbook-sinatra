class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end
  
  get '/genres/new' do
    if session[:user_id]
      erb :'/genres/new'
    else
      flash[:error] = "You have to be logged in to create a genre!"
      redirect '/login'
    end
  end  
end