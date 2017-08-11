class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee.company, notice: "Bienvenido a Ojos Rojos #{@employee.first_name} #{@employee.last_name}"}
      else
        format.html { render :new }
      end
    end
  end


  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :company_id, :area_id)
    end

end
