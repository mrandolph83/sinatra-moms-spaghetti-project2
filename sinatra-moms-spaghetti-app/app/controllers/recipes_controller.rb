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
      @recipe = Recipe.create(title: params[:title], content: params[:content], category: params[:category], user_id: current_user.id)
      erb :"/reviews/new.html"
      # Recirects destroy 
    else
      flash[:message] = "Please enter your recipe information below."
      redirect '/recipes/new'
    end
  end

  # GET: Recipe Show Page
  get "/recipes/:id" do
   set_recipe
    # binding.pry
    erb :"/recipes/show.html"
  end

  # GET: Edit Recipe to edit.erb, so you can render an edit form with patch
  get "/recipes/:id/edit" do 
    set_recipe
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
    set_recipe
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

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    set_recipe
    if @recipe.user == current_user
      @recipe.destroy
      redirect "/recipes"
    else
      redirect "/recipes"
    end
    
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
