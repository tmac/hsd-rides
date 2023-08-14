class Calculator::Earnings
  class << self
    # earnings = $12 + $1.50 per mile beyond 5 miles +
    # ride duration * $0.70 per minute beyond 15 minutes
    def calculate ride
      @ride = ride
      12.00 + distance_bonus + duration_bonus
    end

    private 

    def distance_bonus
      bonus_miles * 1.50 # 382 bonus = $573
    end

    def duration_bonus
      bonus_minutes * 0.70 # 352 bonus = $246.4
    end

    def bonus_miles
      [@ride.distance - 5, 0].max
    end

    def bonus_minutes
      [@ride.duration - 15, 0].max
    end
  end
end
