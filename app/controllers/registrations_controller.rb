class RegistrationsController < ApplicationController
    def create
        @registration = Registration.new(registration_params)
        if @registration.duplicate?
          flash[:warning] = "You've already registered for this course"
          redirect_to courses_path
        else
          if @registration.save
            flash[:success] = "You have been registered for #{@registration.course.name}"
            redirect_to user_path(current_user)
          else
            flash[:danger] = "Something went wrong"
            render courses_path
          end
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
