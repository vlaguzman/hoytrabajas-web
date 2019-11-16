class Companies::FirstOffer::StepEightsController < ApplicationController
  before_action :authenticate_company!

  def show
    raise_login_count(current_company)
    company_presenter
  end

  private

  def company_presenter(company: current_company)
    @company = company
    @company = Companies::FirstOffer::StepEightPresenter.new(company)
  end
end
