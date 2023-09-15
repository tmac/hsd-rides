require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe "scopes" do 
    describe "with_score_for_driver" do
      let(:driver1) { create(:driver) }
      let(:driver2) { create(:driver) }
      let(:ride1)   { create(:ride)   }
      let(:ride2)   { create(:ride)   }
      let!(:commute1) { create(:commute, ride: ride1, driver: driver1) }
      let!(:commute2) { create(:commute, ride: ride2, driver: driver1) }

      it "returns rides for driver" do
        expect(driver1.rides).to include(ride1, ride2)
      end

      it "does not return rides for driver" do
        expect(driver2.rides).to_not include(ride1, ride2)
      end
    end
  end
  
  describe "callbacks" do
    describe "after commit" do 
      describe "on create" do
        let!(:ride) { build(:ride) }

        it "queues calculations" do
          expect {
            ride.save
          }.to have_enqueued_job(RideCalculationsJob).with(ride)
        end

        it "creates commutes" do
          expect {
            ride.save
          }.to have_enqueued_job(CommuteCreationJob).with(ride)
        end
      end

      describe "on update" do
        let!(:ride) { create(:ride) }

        describe "address changes" do
          it "queues calculations after start address changes" do
            ride.start_address = "new address"
            expect {
              ride.save
            }.to have_enqueued_job(RideCalculationsJob).with(ride)
          end

          it "queues calculations after destination address changes" do
            ride.destination_address = "new address"
            expect {
              ride.save
            }.to have_enqueued_job(RideCalculationsJob).with(ride)
          end

          it "rebuilds commutes after start address changes" do
            ride.start_address = "new address"

            expect {
              ride.save
            }.to have_enqueued_job(CommuteCreationJob).with(ride)
          end

          it "rebuilds commutes after destination address changes" do
            ride.destination_address = "new address"
            
            expect {
              ride.save
            }.to have_enqueued_job(CommuteCreationJob).with(ride)
          end
        end

        describe "when non-address attributes change" do
          it "no jobs should be queued" do
            ride.attributes = { distance: 1, duration: 2, earnings: 3 }
            
            expect {
              ride.save
            }.to_not have_enqueued_job
          end
        end
      end
    end
  end
end
