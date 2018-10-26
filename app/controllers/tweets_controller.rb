class TweetsController < ApplicationController
  
  get '/tweets/new' do
    erb :"/tweets/new"
  end 
  
  get '/tweets' do
    if logged_in?  
      @tweets = Tweet.all
      erb :"/tweets/index"
    else
      redirect "/login"
    end 
  end 
  
  post '/tweets' do
    if logged_in?  
     if params[:content] == ""
       redirect "/tweets/new"
      else 
        @tweet = Tweet.create(content: params[:content])
        current_user.tweets << @tweet
        @tweet.save
        erb :"/tweets/show/#{"
     end 
    else 
      redirect "/login"
    end 
  end 


end
