require "rails_helper"

RSpec.describe Users::ProfilesPresenter do
  let!(:job_category)      { create(:job_category) }
  let!(:educational_level) { create(:educational_level) }
  let!(:work_experience)   { create(:work_experience) }
  let!(:user)              { create(:user) }
  let!(:curriculum_vitae)  { create(:curriculum_vitae, user: user, educational_level_ids: [educational_level.id], work_experience_ids: [work_experience.id], job_category_ids: [job_category.id]) }
  let(:subject)            { described_class.new(user) }

  describe "#contact_number_with_format" do
    context "When a user has a number" do
      it "Should return number transform" do
        response = subject.contact_number_with_format

        expect(response).to eq("311 353 5522")
      end
    end
  end

  describe "#data_education" do
    context "When a user has a data" do
      it "Should return data user" do
        response = subject.data_education
        result = [
          {
            title: "Software Engineer",
            institution_name: "massachusetts institute of technology",
            city_id: educational_level.city.description,
            start_date: educational_level.start_date,
            finish_date: educational_level.finish_date,
            ongoing_study: false
          }
        ]

        expect(response).to eq(result)
      end
    end
  end

  describe "#data_experience" do
    context "When a user has a data" do
      it "Should return data user" do
        response = subject.data_experience
        result = [
          {
            company_name: work_experience.company_name,
            work_position: work_experience.work_position.description,
            job_category: work_experience.job_category.description,
            started_at: work_experience.started_at,
            finished_at: work_experience.finished_at,
            still_in_progress: false
          }
        ]

        expect(response).to eq(result)
      end
    end
  end

  describe "#download_cv" do
    context "When user upload curriculum vitae" do
      it "Should return file" do
        curriculum_vitae.file_cv.attach(io: File.open(Rails.root.join('spec', 'factories', 'pdfs', 'diploma.pdf')), filename: 'diploma.pdf')

        response = subject.download_cv

        expect(response.include?("diploma.pdf")).to be_truthy
      end
    end
  end

  describe "#interests_present?" do
    context "When a user has interests" do
      it "Should return interests of a user" do
        response = subject.interests_present?
        result = {
          job_categories: true,
          contract_type: false,
          offer_types: false,
          work_modes: false
        }

        expect(response).to eq(result)
      end
    end
  end

  describe "#abilities_present?" do
    context "When a user has abilities" do
      it "Should return abilities of a user" do
        response = subject.abilities_present?
        result = {
          languages_list: false,
          soft_skills: false
        }

        expect(response).to eq(result)
      end
    end
  end

  describe "#all_attributes_present?" do
    context "When a user has all attributes" do
      it "Should return true" do
        interests = subject.interests_present?
        response = subject.all_attributes_present?(interests)

        expect(response).to be_truthy
      end

      it "Should return false" do
        abilities = subject.abilities_present?
        response = subject.all_attributes_present?(abilities)

        expect(response).to be_falsy
      end
    end
  end
end