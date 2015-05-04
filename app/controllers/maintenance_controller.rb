class MaintenanceController < ApplicationController
  def new
    @maintenance_forms = MaintenanceForm.new
  end

  def index
    @maintenance_forms = MaintenanceForm.all
  end

  def show
  @maintenance_forms = MaintenanceForm.find(params[:id])
  end

  def create
    @maintenance_forms = MaintenanceForm.new(maintenance_params)
    if @maintenance_forms.save
      flash[:success] = "Thank you for letting us know, we will address the issue."
      redirect_to :back
    else
      render "new"
    end

  end

  private

    def maintenance_params
      params.require(:maintenance_forms).permit(:issueString, :timestamp)
    end

end
