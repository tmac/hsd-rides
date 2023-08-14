class RideCalculationsJob < ApplicationJob
  queue_as :critical

  def perform(ride)
    ride.distance = 
      Calculator::Directions::Distance.calculate(ride.start_address, ride.destination_address)
    ride.duration = 
      Calculator::Directions::Duration.calculate(ride.start_address, ride.destination_address)
    ride.earnings = 
      Calculator::Earnings.calculate(ride)
    ride.calculations_updated_at = DateTime.current
    ride.save!
  end
end
