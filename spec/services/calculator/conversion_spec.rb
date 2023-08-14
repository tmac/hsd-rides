require 'rails_helper'

RSpec.describe Calculator::Conversion::Distance do
  describe 'instance methods' do
    let(:calculator) { described_class }

    describe 'meters_to_miles' do  
      it "should convert 16093.4 meters to 10 miles" do 
        expect(calculator.new(16093.4).meters_to_miles).to eq(10)
      end
    end
  end
end

RSpec.describe Calculator::Conversion::Duration do
  describe 'instance methods' do
    let(:calculator) { described_class }

    describe 'seconds_to_minutes' do  
      it "should convert 180 seconds to 3 minutes" do 
        expect(calculator.new(180).seconds_to_minutes).to eq(3)
      end
    end

    describe 'minutes_to_hours' do
      it "should convert 180 minutes to 3 hours" do 
        expect(calculator.new(180).minutes_to_hours).to eq(3)
      end
    end
  end
end