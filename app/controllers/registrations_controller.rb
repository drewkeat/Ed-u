class RegistrationsController < ApplicationController
    def create
        @registration = Registration.new(registration_params)
        @course = Course.find(params[:registration][:course_id])
        if @registration.save
          flash[:success] = "You have been registered for #{@course.name}"
          redirect_to user_path(current_user)
        else
          flash[:danger] = "Something went wrong"
          render courses_path
        end
    end

    def destroy
        @registration = Registration.find(params[:registration_id])
        @registration.delete
        redirect_to user_path(current_user)
    end

    private
    def registration_params
        params.require(:registration).permit(:course_id,:learner_id)
    end
end
