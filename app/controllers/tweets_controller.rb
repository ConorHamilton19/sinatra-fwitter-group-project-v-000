class TweetsController < ApplicationController
  
  get '/tweets/new' do
    erb :"/tweets/new"
  end 
  
  get '/tweets' do
      
    @tweets = Tweet.all
    erb :"/tweets/index"
  end 


end
