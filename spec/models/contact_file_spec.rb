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
        before do
          allow(contact_file).to receive(:update)
          allow(contact_file).to receive(:generate_contacts)
        end
        
        it { expect(contact_file.generate_contacts).not_to eq("") }
      end
    end
  end
end
