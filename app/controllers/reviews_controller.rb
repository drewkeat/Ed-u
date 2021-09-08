class ReviewsController < ApplicationController
    
    def index
      if params[:user_id].present? && @reviews = User.find(params[:user_id]).reviews
      render 'index'
      elsif params[:course_id].present? && @reviews = Course.find(params[:course_id]).reviews
        render 'index'
      else
        flash[:warning] = "Invalid request"
        redirect_to current_user
      end
    end
    
    def new
        if params[:user_id].present? && reviewable = User.find(params[:user_id])
          @review = Review.new
          @review.reviewable = reviewable
          render 'new'
        elsif params[:course_id].present? && reviewable = Course.find(params[:course_id])
          @review = Review.new
          @review.reviewable = reviewable
          render 'new'
        else
          flash[:warning] = "Invalid request"
          redirect_to current_user
        end
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
