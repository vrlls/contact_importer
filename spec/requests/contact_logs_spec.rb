require 'rails_helper'

RSpec.describe "ContactLogs", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }

    subject { get contact_logs_path }

    before { sign_in user }

    context "without contact files" do
      before { subject }

      it { expect(assigns(:contact_logs)).to be_empty }
      it { expect(response.status).to eq(200) }
    end

    context "with contact files" do
      let!(:contact_logs) { create(:contact_log, user: user) }

      before { subject }

      it { expect(assigns(:contact_logs)).to match_array(contact_logs) }
    end
  end

end
