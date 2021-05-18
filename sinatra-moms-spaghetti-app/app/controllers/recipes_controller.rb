class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    @recipes = Recipe.all
    erb :"/recipes/index.html"
  end

  # GET: /recipes/new
  get "/recipes/new" do
    erb :"/recipes/new.html"
  end

  # POST: /recipes
  post "/recipes" do
    # I only want to create if it has content
    # I only want to save if it has content
    # I also only want to create a recipe if a user is logged in
    if !logged_in?
      flash[:errors] = "You must login or sign up to perform this action."
      redirect '/'
    end

    if params[:content] != ""
      # create a new recipe. also create a new category class, maybe
      # gorup it with rating in a classify class
      @recipe = Recipe.create(title: params[:title], content: params[:content], category: params[:category], 
      pic_url: params[:pic_url], user_id: current_user.id)

      redirect "recipes/#{@recipe.id}"
      # Recirects destroy 
    else
      flash[:message] = "Please enter your recipe information below."
      redirect '/recipes/new'
    end
  end

  # GET: Recipe Show Page
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    # binding.pry
    erb :"/recipes/show.html"
  end

  post "/recipes/:id" do   
    @review = Review.create(simple_review: params[:simple_review], 
    healthy_review: params[:healthy_review], comments: params[:comments], tasty_review: params[:tasty_review], 
    user_id: params[:user_id], recipe_id: params[:recipe_id])
     redirect "/recipes"
   end

  # GET: Edit Recipe to edit.erb, so you can render an edit form with patch
  get "/recipes/:id/edit" do 
     @recipe = Recipe.find(params[:id])
    if logged_in?
    if @recipe.user == current_user
    erb :"/recipes/edit.html"
    else
      redirect "users/#{current_user.id}"
    end
  else
    flash[:errors] = "You must login or sign up to perform this action."
    redirect "/"
    end
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
     @recipe = Recipe.find(params[:id])
    if logged_in?
      if @recipe.user == current_user && params[:content] != ""
  # Find the recipe
  # Update the recipe
  # REdirect to show page
    @recipe.update(title: params[:title], content: params[:content], category: params[:category], simple_review: params[:simple_review])
    redirect "/recipes/#{@recipe.id}"
      else 
        redirect "users/#{current_user.id}"
  end
  else
    flash[:errors] = "You must login or sign up to perform this action."
  redirect "/"
  end
end

get "/recipes/:id/destroy" do

  @recipe = Recipe.find(params[:id])
  # binding.pry
  erb :"/recipes/destroy.html"
end


  # DELETE: /recipes/5/delete
  delete "/recipes/:id/destroy" do
    @recipe = Recipe.find(params[:id])
 
    "Hello world"
    if @recipe.user == current_user
      @recipe.destroy
      redirect "/users/#{current_user.id}"
    else
      redirect "/recipes"
    end
    
  end
end

  
