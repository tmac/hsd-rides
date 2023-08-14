class CommuteCreationJob < ApplicationJob
  queue_as :critical

  # In the real world we'd need some way to more narrowly scope these commute creations
  # and possibly run different jobs for different batches of rides/drivers.
  def perform(resource)
    if resource.is_a?(Ride)
      Driver.find_each do |driver|
        create_commute_for(driver, resource)
      end
    elsif resource.is_a?(Driver)
      Ride.find_each do |ride|
        create_commute_for(resource, ride)
      end
    end
  end

  def create_commute_for driver, ride
    from     = driver.home_address
    to       = ride.start_address
    distance = Calculator::Directions::Distance.calculate(from, to)
    duration = Calculator::Directions::Duration.calculate(from, to)

    commute = Commute.new(driver:   driver,   ride: ride, 
                          distance: distance, duration: duration,
                          calculations_updated_at: DateTime.current)
    commute.ride_score = Calculator::Score.calculate(commute, ride)
    commute.save
  end
end
