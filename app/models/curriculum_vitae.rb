class CurriculumVitae < ApplicationRecord
  validates_presence_of :user, :area_code, :city, :about_me, :release_date, :labor_disponibility,
                        :work_mode, :travel_disponibility, :visits_count

  belongs_to :user
  belongs_to :city
  belongs_to :labor_disponibility
  belongs_to :gender
  belongs_to :work_mode
  belongs_to :contract_type

  has_many :visits

  has_and_belongs_to_many :soft_skills
  has_and_belongs_to_many :limitations

  has_one_attached :photo
end