require 'rails_helper'

RSpec.describe OffersTechnicalSkills, type: :model do

  describe "associations" do
    it  { should belong_to(:level) }
    it  { should belong_to(:offer) }
    it  { should belong_to(:technical_skill) }
  end
end
