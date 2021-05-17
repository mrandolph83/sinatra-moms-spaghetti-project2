class UsersController < ApplicationController

  # GET login
  get "/login" do
    erb :"/users/login.html"
  end

  # GET new user at /users/signup
  get "/signup" do
    erb :"/users/signup.html"
  end

    # POST new user 
  post "/users" do
    @user = User.new(params)
    if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
      else
      flash[:errors] = "New account is invalid: #{@user.errors.full_messages.to_sentence}"
        redirect "/signup"
      end
  end

  # POST login
  post '/login' do 
  @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      # What does authenticate do EXACTLY?
    session[:user_id] = @user.id
    # flash[:message] = "Welcome, #{@user.name}!"
    redirect "/users/#{@user.id}"
    else
      # binding.pry
      flash[:error] = "Your credentials were invalid.  Please sign up or try again."
      redirect "/login"
    end
   
  end

  # User SHOW Route
  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    
    erb :"/users/show.html"
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
