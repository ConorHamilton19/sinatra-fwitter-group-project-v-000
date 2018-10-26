class UsersController < ApplicationController
  
  get "/signup" do 
    if !logged_in?
      erb :"/users/new"
    else
      redirect :"/tweets"
    end 
  end 
  
  post "/signup" do 
     if 
       params[:username] == "" || params[:email] == "" || params[:password] == ""
       redirect "/signup"
     else
       @user = User.create(username: params[:username], email: params[:email], password: params[:password])
       @user.save
       session[:user_id] = @user.id
       redirect "/tweets"
     end 
  end
  
  get "/login" do
    if
      !logged_in?
        erb :"/users/login"
    else
      redirect "/tweets"
    end 
  end
  
  post "/login" do 
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect "/users/new"
    end 
  end 
  
  get "/logout" do 
    session.clear
    redirect "/users/login"
  end 


end
