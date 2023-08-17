class Api::V1::RidesController < ApplicationController
  before_action :set_driver
  before_action :set_rides

  def index
    if @rides
      render json: @rides, each_serializer: Api::V1::RideSerializer, 
                           driver:          @driver,
                           meta:            { status:       :succeeded,
                                              total_pages:  @rides.total_pages, 
                                              current_page: @rides.current_page }
    else
      render json: { meta: { status: :failed, message: "no driver or rides found" } }, status: :bad_request
    end
  end

  private

  def set_driver
    @driver = Driver.find_by_id(params[:driver_id]) 
  end

  def set_rides
    if @driver.present?
      @rides = @driver.rides.paginate(page: params[:page] || 1, per_page: params[:per_page] || 5)
    end
  end

end