class RecipesSortedController < ApplicationController

  # GET: /recipes
  get "/recipes_sorted/breakfast" do
    @recipes = Recipe.all
    erb :"/recipes/breakfast.html"
  end

  get "/recipes_sorted/main_dish" do
    @recipes = Recipe.all
    erb :"/recipes/main_dish.html"
  end

  get "/recipes_sorted/side_dish" do
    @recipes = Recipe.all
    erb :"/recipes/side_dish.html"
  end

  get "/recipes_sorted/appetizer" do
    @recipes = Recipe.all
    erb :"/recipes/appetizer.html"
  end

  get "/recipes_sorted/dessert" do
    @recipes = Recipe.all
    erb :"/recipes/dessert.html"
  end

  
end

  
