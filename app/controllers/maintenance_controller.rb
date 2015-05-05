class MaintenanceController < ApplicationController
  def new
    @maintenance_form = MaintenanceForm.new
  end

  def index
    @maintenance_form = MaintenanceForm.all
  end

  def show
  @maintenance_form = MaintenanceForm.find(params[:id])
  end

  def create
    @maintenance_form = MaintenanceForm.new(maintenance_params)
    if @maintenance_form.save
      flash[:success] = "Thank you for letting us know, we will address the issue."
      redirect_to 'maintenance_form'
    else
      render 'new_request'
    end

  end

  private

    def maintenance_params
      params.require(:maintenance_form).permit(:issueString, :timestamp)
    end

end
