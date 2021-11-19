require 'rails_helper'

RSpec.describe "ContactFiles", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }

    subject { get contact_files_path }

    before { sign_in user }

    context "without contact files" do
      before { subject }

      it { expect(assigns(:contact_files)).to be_empty }
      it { expect(response.status).to eq(200) }
    end

    context "with contact files" do
      let!(:contact_files) { create_list(:contact_file, 2) }

      before { subject }

      it { expect(assigns(:contact_files)).to match_array(contact_files) }
    end
  end
end
