class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/new'
  end
  
  get '/login' do
    if session[:user_id].nil?
      erb :'/users/login'
    else
      redirect "/users/#{session[:user_id]}"
    end
  end
  
  get '/logout' do
    if session[:user_id]
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end  
  
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
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
      redirect '/login'
    end    
  end
  
end