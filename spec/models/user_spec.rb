require 'rails_helper'

RSpec.describe User, type: :model do
  describe "asosciations" do
    it { is_expected.to have_many(:contact_files) }
    it { is_expected.to have_many(:contacts) }
  end

  describe "validatations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
