require 'rails_helper'

RSpec.describe WorkMode, type: :model do
  describe "validations" do
    it { should validate_presence_of(:description) }
  end

end
