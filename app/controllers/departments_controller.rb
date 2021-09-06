class DepartmentsController < ApplicationController
    def index
        @departments = Department.all
    end

    def new
        @department = Department.new
    end
    
    def create
        @department = Department.new(department_params)
        if @department.save
          flash[:success] = "Department successfully created"
          redirect_to @department
        else
          flash[:danger] = "Something went wrong"
          render 'new'
        end
    end

    def edit
        @department = Department.find(params[:id])
    end
    
    def update
        @department = Department.find(params[:id])
        if @department.update_attributes(params[:department])
          flash[:success] = "Department was successfully updated"
          redirect_to @department
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    def destroy
        @department = Depratment.find(params[:id])
        if @department.destroy
            flash[:success] = 'Depratment was successfully deleted.'
            redirect_to departments_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to departments_url
        end
    end
    
    private

    def department_params
        params.require(:department).permit(:name)
    end
    
end
