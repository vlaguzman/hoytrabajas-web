class EducationalLevel < ApplicationRecord
  validates_presence_of :institution_name,:start_date,:finish_date,:degree,:ongoing_study

  belongs_to :city
  belongs_to :curriculum_vitae
end