class MaintenanceController < ApplicationController
  def new
    @maintenance = MaintenanceForm.new
  end

  def create
    @maintenance = MaintenanceForm.new(maintenance_params)
    if @maintenance.save
      flash[:success] = "Thank you for letting us know, we will address the issue."
      redirect_to @maintenance
    else
      render "new"
    end

  end

  private

    def maintenance_params
      params.require(:maintenance).permit(:issueString, :timestamp)
    end

end
