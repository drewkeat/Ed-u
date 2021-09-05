class ReviewsController < ApplicationController
    
    def new
        @review = Review.new(review_params)
    end
    
    def create
        @review = Review.new(review_params)
        if @review.save
          flash[:success] = "Review submitted"
          redirect_to current_user
        else
          flash[:danger] = "Something went wrong"
          render current_user
        end
    end
    
    private
    
    def review_params
        params.require(:review).permit(:content, :reviewer_id, :reviewable_type, :reviewable_id)
    end
end
