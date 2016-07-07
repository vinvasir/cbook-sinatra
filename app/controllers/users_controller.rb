class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/new'
  end
  
  get '/login' do
    if session[:user_id].nil?
      erb :'/users/login'
    else
      flash[:error] = "You're already logged in!"
      redirect "/users/#{session[:user_id]}"
    end
  end
  
  get '/logout' do
    if session[:user_id]
      session.clear
      redirect '/'
    else
      flash[:error] = "You're not even logged in to begin with!"
      redirect '/login'
    end
  end  
  
  get '/users/:id' do
    @user = User.find(params[:id])
    if @user.id == session[:user_id]
      erb :'/users/show'
    else
      flash[:error] = "You need to be logged in to see your profile!"
      redirect '/login'
    end
  end
  
  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      redirect '/signup'
    end
  end
  
  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{session[:user_id]}"
    else
      flash[:error] = "Please enter a valid username and password"
      redirect '/login'
    end    
  end
  
end