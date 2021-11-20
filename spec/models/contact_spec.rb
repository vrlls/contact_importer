require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "asosciations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:credit_card) }
  end

  describe "callbacks" do
    describe "after_create" do
      describe "#set_franchise" do
        let(:user) { create(:user) }
        let(:contact) { create(:contact, user: user) }
        let(:detector) { CreditCardValidations::Detector.new(contact.credit_card) }
        before do
          allow(contact).to receive(:update).with(franchise: detector.brand.to_s)
          allow(contact).to receive(:set_franchise)
        end        
        it {
          expect(contact.franchise).not_to eq("")
        }
      end
    end
  end

  describe "instance methods" do
    describe "#get_credit_card" do
      let(:contact) { create(:contact, credit_card: "4111111111111111") }

      it{ expect(contact.get_credit_card).to eq("**** **** 1111") }
    end
  end
end
