# (ride earnings) / (commute duration + ride duration). 
class Calculator::Score
  class << self
    def calculate commute, ride
      minutes = commute.duration + ride.duration
      return 0 if [0, nil].any?(ride.earnings) 
      return 0 if [0, nil].any?(minutes)
      per_minute = (ride.earnings / minutes).round(2)
      per_minute * 60
    end
  end
end
