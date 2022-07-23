class ServiceHoursController < ApplicationController
  before_action :set_service_hour, only: %i[show edit update destroy]

  # PATCH/PUT /service_hours/1 or /service_hours/1.json
  def update
    respond_to do |format|
      if @service_hour.update(service_hour_params)
        format.json { render json: { status: :ok } }
      else
        format.json { render json: @service_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service_hour
    @service_hour = ServiceHour.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def service_hour_params
    params.require(:service_hour).permit(:employee_id)
  end
end
