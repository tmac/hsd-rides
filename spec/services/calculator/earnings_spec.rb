require 'rails_helper'

RSpec.describe Calculator::Earnings do
  describe 'class methods' do
    let(:calculator) { described_class }

    describe 'ride with no bonus' do
      let(:ride) { Ride.create(distance: 3.0, duration: 12.0) }

      it "should eq $12" do 
        expect(calculator.calculate(ride)).to eq(12)
      end
    end

    describe 'ride with 5 mile distance bonus at $1.50 per mile' do 
      let(:ride) { Ride.create(distance: 10.0, duration: 12.0) }

      it "should eq $19.5" do 
        expect(calculator.calculate(ride)).to eq(19.5)
      end
    end

    describe 'ride with 10 minute duration bonus at $0.70 per minute' do 
      let(:ride) { Ride.create(distance: 3.0, duration: 25.0) }

      it "should eq $19" do 
        expect(calculator.calculate(ride)).to eq(19)
      end
    end

    describe 'ride with 10 minute duration and a 5 mile distance bonus' do 
      let(:ride) { Ride.create(distance: 10.0, duration: 25.0) }

      it "should eq $26.50" do 
        expect(calculator.calculate(ride)).to eq(26.5)
      end
    end

  end
end