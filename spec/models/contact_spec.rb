require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "asosciations" do
    it { is_expected.to belong_to(:user) }
  end
end
