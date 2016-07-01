class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end
  
  get '/artists/new' do
    if session[:user_id]
      erb :'/artists/new'
    else
      flash[:error] = "You have to be logged in to create an artist!"
      redirect '/login'
    end
  end
  
  post '/artists' do
    @artist = Artist.new(params)
    if @artist.save
      redirect '/artists'
    else
      flash[:error] = "You must enter an artist name!"
      redirect '/artists/new'
    end
  end
end