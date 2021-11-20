require 'rails_helper'

RSpec.describe ContactFile, type: :model do
  describe "asosciations" do
    it { is_expected.to belong_to(:user) }
    it{ is_expected.to have_one_attached(:csv) }
  end

  describe "callbacks" do
    describe "after create commit" do
      describe "#generate_contacts" do
        let(:contact_file) { create(:contact_file) }

        before { allow(contact_file).to receive(:generate_contacts) }
        
        it {}
      end
    end
  end
end
