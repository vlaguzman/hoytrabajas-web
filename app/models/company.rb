class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable

  validates_presence_of :email

  belongs_to :employees_range, optional: true
  belongs_to :city, optional: true

  has_and_belongs_to_many :users

  has_many :offers

  has_one_attached :logo

  delegate :description, to: :employees_range, prefix: :employees_range, allow_nil: true

  def after_confirmation
    self.update_attribute(:confirmed_at, DateTime.now)
  end

end
