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
        redirect "/tweets/show/#{@tweet.id}"
     end 
    else 
      redirect "/login"
    end 
  end 
  
  get "/tweets/:id" do 
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/show'
    else
      redirect to '/login'
    end 
  end 
  
  get "/tweets/:id/edit"
  end


end
