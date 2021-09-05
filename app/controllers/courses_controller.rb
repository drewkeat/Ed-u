class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end
    
    def create
        @course = Course.new(course_params)
        if @course.save
          flash[:success] = "Course successfully created"
          redirect_to @course
        else
          flash[:danger] = "Something went wrong"
          render 'new'
        end
    end
    

    def show
        @course = Course.find(params[:id])
    end

    private

    def course_params
        params.require(:course).permit(:name, :description, :status, :facilitator_id, :start_time, :end_time)
    end
end
