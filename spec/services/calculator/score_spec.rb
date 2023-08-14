require 'rails_helper'

RSpec.describe Calculator::Score do
  describe 'class methods' do
    let(:calculator) { described_class }

    describe 'with a total duration of 0' do  
      let(:commute)    { Commute.create(duration: 0) }
      let(:ride)       { Ride.create(duration: 0, earnings: 12) }

      it "should eq $0" do 
        expect(calculator.calculate(commute, ride)).to eq(0)
      end
    end

    describe 'with earnings of 0' do  
      let(:commute)    { Commute.create(duration: 5) }
      let(:ride)       { Ride.create(duration: 5, earnings: 0) }

      it "should eq $0" do 
        expect(calculator.calculate(commute, ride)).to eq(0)
      end
    end

    describe 'with a total duration of 15 minutes and an earnings of $12' do
      let(:commute)    { Commute.create(duration: 3) }
      let(:ride)       { Ride.create(duration: 12, earnings: 12) }

      it "should eq $40.00 per hour" do 
        expect(calculator.calculate(commute, ride)).to eq(48)
      end
    end

  end
end