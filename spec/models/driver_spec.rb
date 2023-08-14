require 'rails_helper'

RSpec.describe Driver, type: :model do
  describe "callbacks" do
    describe "after commit" do 
      describe "on create" do
        let!(:driver) { build(:driver) }

        it "creates commutes" do
          ActiveJob::Base.queue_adapter = :test
          expect {
            driver.save
          }.to have_enqueued_job(CommuteCreationJob).with(driver)
        end
      end

      describe "on update" do
        let!(:driver) { create(:driver) }

        describe "address changes" do
          it "queues the cummute creation job" do
            ActiveJob::Base.queue_adapter = :test
            driver.home_address = "new address"

            expect {
              driver.save
            }.to have_enqueued_job(CommuteCreationJob).with(driver)
          end
        end

        describe "when non-address attributes change" do
          it "no jobs should be queued" do
            ActiveJob::Base.queue_adapter = :test
            driver.updated_at = DateTime.current
            
            expect {
              driver.save
            }.to_not have_enqueued_job
          end
        end
      end
    end
  end
end

