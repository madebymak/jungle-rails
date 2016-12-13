class ReviewsController < ApplicationController
   before_action :require_login

   def create
     @product = Product.find(params[:product_id].to_i)
     @review = @product.reviews.new(review_params)
     @review.user_id = current_user.id
     if @review.save
       redirect_to product_path(@product), notice: "Review submitted"
     else
       render @product
     end
   end

   def destroy
     @review = Review.find params[:id]
     @review.destroy
     redirect_to product_path(params[:product_id])
   end

   private

   def review_params
     params.require(:review).permit(:description, :rating)
   end

   def require_login
     unless current_user
       flash[:error] = "You must be logged in to access this section"
     end
   end

 end
