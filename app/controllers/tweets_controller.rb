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
    @tweet = Tweet.create(content: params[:content])
  end 


end
