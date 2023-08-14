class Api::V1::RidesController < ApplicationController
  before_action :set_driver
  before_action :set_rides

  def index
    if @rides
      render json: { status: :succeeded, rides: @rides, total_pages: @rides.total_pages, current_page: @rides.current_page }, status: :ok
    else
      render json: { status: :failed, message: "no driver or rides found" }, status: :bad_request
    end
  end

  private

  def set_driver
    @driver = Driver.find_by_id(params[:driver_id]) 
  end

  def set_rides
    if @driver.present?
      @rides = Ride.with_score_for_driver(@driver).paginate(page: params[:page] || 1, per_page: 5)
    end
  end

end