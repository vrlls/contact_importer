require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET #index" do
    let(:user) { create(:user) }

    subject { get root_path }

    before { sign_in user }

    context "without contact files" do
      before { subject }

      it { expect(assigns(:contacts)).to be_empty }
      it { expect(response.status).to eq(200) }
    end

    context "with contact files" do
      let!(:contact) { create(:contact, user: user) }

      before { subject }

      it { expect(assigns(:contacts)).to match_array(contact) }
    end
  end

end
