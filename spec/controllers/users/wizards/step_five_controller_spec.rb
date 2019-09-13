require 'rails_helper'

RSpec.describe Users::Wizards::StepFiveController, type: :controller do

  describe "GET users_wizard_step_five#show" do
    let(:candidate) { create(:user, :first_time_candidate) }
    let(:cv) { create(:curriculum_vitae, user: candidate) }

    it "should render users_wizard_step_five#show template" do
      get :show

      expect(response).to render_template(:show)
    end

  end

end