require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "anyone_can_cook"
    register Sinatra::Flash
    
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "New account is invalid: #{@user.errors.full_messages.to_sentence}"
        redirect '/' 
      end
    end

    def simple_review(id)
    simple_array = [] 

    Recipe.all[id.to_i].reviews.each do |review|
    simple_array << review.simple_review
    end
    
    simple_average = simple_array.sum(0.0)/simple_array.count
    simple_average 
    end 


  end

end
