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
    if !logged_in?
      flash[:errors] = "You must login or sign up to perform this action."
      redirect '/'
    end

    if params[:content] != ""
      @recipe = Recipe.create(title: params[:title], content: params[:content], category: params[:category], 
      pic_url: params[:pic_url], user_id: current_user.id)
      @review = Review.create(simple_review: "", healthy_review: "", comments: "", tasty_review: "", user_id: current_user.id, recipe_id: @recipe.id)
      flash[:message] = "Congratulations, you have sucessfully posted your #{@recipe.title} recipe."
      redirect "/reviews/#{@review.id}/edit"
  
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
  
    @recipe.update(title: params[:title], content: params[:content], category: params[:category], 
    pic_url: params[:pic_url], user_id: current_user.id)
    redirect "/recipes/#{@recipe.id}"
      else 
        redirect "users/#{current_user.id}"
  end
  else
    flash[:errors] = "You must login or sign up to perform this action."
  redirect "/"
  end
end

get "/recipes/delete/:id" do

  @recipe = Recipe.find(params[:id])
  # binding.pry
  erb :"/recipes/delete.html"
end


  # DELETE: /recipes/5/delete
  delete "/recipes/delete/:id" do
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

  
