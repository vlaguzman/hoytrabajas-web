class OffersSalaries < ApplicationRecord
  validates_presence_of  :from

  belongs_to :offer
  belongs_to :salary_period
  belongs_to :salary_type
  belongs_to :currency
end
