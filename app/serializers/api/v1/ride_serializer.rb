class Api::V1::RideSerializer < ActiveModel::Serializer
  # commute could be nested
  attributes :id,
             :start_address, 
             :destination_address,
             :distance,
             :duration,
             :earnings,
             :score,
             :commute_distance,
             :commute_duration,
             :calculations_updated_at,
             :created_at,
             :updated_at

  def score
    commute.ride_score
  end

  def commute_distance
    commute.distance
  end

  def commute_duration
    commute.duration
  end

  private

  def commute
    driver = instance_options[:driver]
    # these commutes are cached
    object.commutes.where(driver_id: driver.id, ride_id: object.id).first
  end

end