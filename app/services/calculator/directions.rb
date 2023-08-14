module Calculator::Directions
  class Distance
    class << self
      def calculate from, to
        meters = Google::Maps.route(from, to).distance.value
        Calculator::Conversion::Distance.new(meters).meters_to_miles
      end
    end
  end

  class Duration
    class << self
      def calculate from, to
        seconds = Google::Maps.route(from, to).duration.value
        Calculator::Conversion::Duration.new(seconds).seconds_to_minutes
      end
    end
  end
end
