require 'rails_helper'

RSpec.describe ImportContactJob, type: :job do
  describe "Import contact job" do
    
    context "should be enqueued" do
      before do
        ActiveJob::Base.queue_adapter = :test
      end

      it "schedules a job in queue" do
        expect {
          ImportContactJob.perform_later
        }.to have_enqueued_job
      end

      it "schedules a job in the queue and job correct" do
        expect {
          ImportContactJob.perform_later
        }.to enqueue_job(ImportContactJob)
      end

      it "schedules a job enqueued with no wait" do
        expect {
          ImportContactJob.perform_later
        }.to have_enqueued_job.at(:no_wait)
      end

      after do
        ActiveJob::Base.queue_adapter = :inline
      end
    end
  end
end
