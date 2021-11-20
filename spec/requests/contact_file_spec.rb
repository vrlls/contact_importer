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
      let!(:contact_files) { create(:contact_file, user: user) }

      before { subject }

      it { expect(assigns(:contact_files)).to match_array(contact_files) }
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }

    before { sign_in user }

    context "valid" do
      let!(:contact_file) { create(:contact_file, user: user) }
    
      subject { get contact_file_path(contact_file.id) }
      
      it { is_expected.to render_template(:show) }
    end

    context "invalid" do
      subject { get contact_file_path('abc') }

      it { is_expected.to eq(404) }
      it { is_expected.to render_template(:index) }
    end

  end
end
