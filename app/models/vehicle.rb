class Vehicle < ApplicationRecord
  validates_presence_of :description

  has_and_belongs_to_many :offers
  has_and_belongs_to_many :users
end