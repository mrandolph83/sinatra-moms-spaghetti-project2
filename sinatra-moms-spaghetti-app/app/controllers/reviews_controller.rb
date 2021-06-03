class ReviewsController < ApplicationController


  get "/reviews/:id/edit" do
    @review = Review.find(params[:id])
  if logged_in?
    if @review.user_id == current_user.id
    erb :"/reviews/edit.html"
    else
      redirect "recipes/#{@review.recipe_id}"
    end
  else
    redirect "/"
    end
  end


 patch "/reviews/:id" do
  @review = Review.find(params[:id])
  if logged_in?
    if @review.user_id == current_user.id 
  @review.update(simple_review: params[:simple_review], 
    healthy_review: params[:healthy_review], comments: params[:comments], tasty_review: params[:tasty_review], 
    user_id: params[:user_id], recipe_id: params[:recipe_id])
    redirect "/recipes/#{@review.recipe_id}"
    else
      redirect "users/#{current_user.id}"
    end
  else
    flash[:errors] = "You must login or sign up to perform this action."
  redirect "/"
  end
end
 
end
