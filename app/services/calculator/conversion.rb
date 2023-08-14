module Calculator::Conversion
  class Distance
    def initialize distance
      @distance = distance.to_d
    end

    def meters_to_miles round = 0
      (@distance / 1609.34.to_d).round(round)
    end
  end

  class Duration
    def initialize duration
      @duration = duration.to_d
    end

    def seconds_to_minutes round = 0
      (@duration / 60.to_d).round(round)
    end

    def minutes_to_hours round = 0
      (@duration / 60.to_d).round(round)
    end
  end
end
