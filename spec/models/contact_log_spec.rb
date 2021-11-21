require 'rails_helper'

RSpec.describe ContactLog, type: :model do
  describe "asosciations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:elements) }
    it { is_expected.to validate_presence_of(:error) }
  end
end
