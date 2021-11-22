
require 'rails_helper'

RSpec.describe ContactCreator, type: :model do
  describe "#call" do
    
    let!(:contact_file) { create(:contact_file) }

    it "Should import 10 successful contacts" do
      ContactCreator.new(contact_file.id).call
      expect(Contact.count).to eq(10)
    end

    it "Should create 4 failed contacts" do
      expect(ContactLog.count).to eq(4)
    end
  end
  
end
