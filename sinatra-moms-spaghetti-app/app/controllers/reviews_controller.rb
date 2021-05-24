class ReviewsController < ApplicationController




  # POST: /reviews
  post "/reviews" do
    
  end

  # GET: /reviews/5
  get "/reviews/:id" do
  
    erb :"/reviews/show.html"
  end


 post "/reviews/:id" do
  @review = Review.create(simple_review: params[:simple_review], 
    healthy_review: params[:healthy_review], comments: params[:comments], tasty_review: params[:tasty_review], 
    user_id: params[:user_id], recipe_id: params[:recipe_id])
     redirect "/recipes/#{@review.recipe_id}"
end

 

  # DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do
   
  end
end
