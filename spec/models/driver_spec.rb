require 'rails_helper'

RSpec.describe Driver, type: :model do
  describe "callbacks" do
    describe "after create" do
      let(:driver) { build(:driver) }

      it "queues calculations" do
        ActiveJob::Base.queue_adapter = :test
        expect {
          driver.save
        }.to have_enqueued_job(CommuteCreationJob).with(driver)
      end
    end
  end
end

