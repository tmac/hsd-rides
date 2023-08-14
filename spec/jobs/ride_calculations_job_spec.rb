require 'rails_helper'

RSpec.describe RideCalculationsJob, type: :job do
  describe "#perform_later" do
    it "runs on the critical queue with no delay" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        RideCalculationsJob.perform_later('ride')
      }.to have_enqueued_job.with('ride').on_queue("critical").at(:no_wait)
    end
  end
end

