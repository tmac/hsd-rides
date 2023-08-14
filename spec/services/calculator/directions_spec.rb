require 'rails_helper'

RSpec.describe Calculator::Directions::Distance do
  describe 'class methods' do
    let(:calculator) { described_class }

    describe 'calculate' do  
      let(:from) { 'Portland, OR' }
      let(:to)   { 'Salem, OR' }

      it "it should be 46 miles from Portland OR to Salem OR" do 
        VCR.use_cassette("distance_calculator") do
          expect(calculator.calculate(from, to)).to eq(46)
        end
      end
    end
  end
end

RSpec.describe Calculator::Directions::Duration do
  describe 'class methods' do
    let(:calculator) { described_class }

    describe 'calculate' do  
      let(:from) { 'Portland, OR' }
      let(:to)   { 'Salem, OR' }

      it "it should be 51 minutes from Portland OR to Salem OR" do 
        VCR.use_cassette("duration_calculator") do
          expect(calculator.calculate(from, to)).to eq(51)
        end
      end
    end
  end
end
