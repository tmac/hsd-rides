require 'rails_helper'

RSpec.describe CommuteCreationJob, type: :job do
  describe "#perform_later" do
    it "runs on the critical queue with no delay" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        CommuteCreationJob.perform_later('commute')
      }.to have_enqueued_job.with('commute').on_queue("critical").at(:no_wait)
    end
  end
end
