require 'rails_helper'

RSpec.describe CurriculumVitae, type: :model do

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should respond_to(:area_code) }
    it { should respond_to(:about_me) }
    it { should respond_to(:release_date) }
    it { should respond_to(:travel_disponibility) }
    it { should respond_to(:visits_count) }
    it { should respond_to(:labor_disponibility) }
    it { should respond_to(:photo) }
    it { should respond_to(:visits) }
    it { should respond_to(:strong_skills) }
    it { should respond_to(:to_learn_skills) }
    it { should respond_to(:strong_languages) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:curriculum_vitae).photo }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:labor_disponibility) }
    it { should belong_to(:contract_type) }
    it { should have_one(:curriculum_vitae_salary) }
    it { should have_many(:visits) }
    it { should have_many(:acknowledgments) }
    it { should have_many(:educational_levels) }
    it { should have_many(:applied_offers) }
    it { should have_and_belong_to_many(:soft_skills) }
    it { should have_and_belong_to_many(:working_days) }
    it { should have_and_belong_to_many(:available_work_days) }
    it { should have_and_belong_to_many(:technical_skills) }
    it { should have_and_belong_to_many(:job_categories) }
    it { should have_and_belong_to_many(:offer_types) }
    it { should have_and_belong_to_many(:work_modes) }
  end

  describe '#soft_skills' do
    let(:cv) { create(:curriculum_vitae) }

    let!(:cv_soft_skills) { create_list(:curriculum_vitaes_soft_skills, 5, curriculum_vitae_id: cv.id) }
    it "Should return the soft skills associated" do
      expect(cv.soft_skills.count).to eq(5)
    end
  end

  describe "#to_learn_skills" do
    let(:cv) { create(:curriculum_vitae) }
    let!(:to_learn_skills_list) { create_list(:curriculum_vitaes_technical_skills, 5, curriculum_vitae_id: cv.id, step_up: true) }

    it "should respond" do
      expect(cv.to_learn_skills.count).to eq(5)
    end
  end

  describe "#strong_languages" do
    let(:cv) { create(:curriculum_vitae) }
    let!(:laguanges_list) { create_list(:curriculum_vitaes_languages, 5, curriculum_vitae_id: cv.id) }

    it "should respond" do
      expect(cv.strong_languages.count).to eq(5)
    end
  end
end
