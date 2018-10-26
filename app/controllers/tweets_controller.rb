class TweetsController < ApplicationController
  
  get '/tweets/new' do
    if logged_in?
      erb :"/tweets/new"
    else 
      redirect "/login"
    end
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
        redirect "/tweets/#{@tweet.id}"
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
  
  get "/tweets/:id/edit" do 
  end
  
  delete '/tweets/:id/delete' do
        if logged_in?
            @tweet = Tweet.find_by_id(params[:id])
            if @tweet && @tweet.user == current_user
                @tweet.delete
                redirect to '/tweets'
            else
                redirect to '/tweets'
            end
        else
            redirect to '/login'
        end
    end
  
  


end
