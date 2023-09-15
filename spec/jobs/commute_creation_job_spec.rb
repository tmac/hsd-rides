require 'rails_helper'

# This is set in the test env, no idea why it's needed here
ActiveJob::Base.queue_adapter = :test

RSpec.describe CommuteCreationJob, type: :job do
  let(:driver) { create(:driver) }
  let(:ride) { create(:ride) }

  describe "#perform" do
    context "when given a Ride resource" do
      it "creates a commute for each driver" do
        allow(Calculator::Directions::Distance).to receive(:calculate).and_return(10)
        allow(Calculator::Directions::Duration).to receive(:calculate).and_return(15)
        allow(Calculator::Score).to receive(:calculate).and_return(8)

        expect {
          CommuteCreationJob.perform_now(ride)
        }.to change(Commute, :count).by(Driver.count)
      end
    end

    context "when given a Driver resource" do
      it "creates a commute for each ride" do
        allow(Calculator::Directions::Distance).to receive(:calculate).and_return(10)
        allow(Calculator::Directions::Duration).to receive(:calculate).and_return(15)
        allow(Calculator::Score).to receive(:calculate).and_return(8)

        expect {
          CommuteCreationJob.perform_now(driver)
        }.to change(Commute, :count).by(Ride.count)
      end
    end
  end
end