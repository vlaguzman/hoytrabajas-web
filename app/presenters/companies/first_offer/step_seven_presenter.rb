#TODO daniel, refactor this class
class Companies::FirstOffer::StepSevenPresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepSeven::FormParamsService.new(
      source: source,
      errors: source.errors,
      action_path: companies_first_offer_step_seven_path,
      previous_path: companies_first_offer_step_six_path,
      next_path: companies_first_offer_step_eight_path,
      form_type: :offer,
      template_translation_path: "companies.first_offer.step_sevens.show",
      form_method: :put
    ).form_params
      .merge({id: source.id})
  end

  private

  def companies_first_offer_step_seven_path
    rails_routes.companies_first_offer_step_seven_path
  end

  def companies_first_offer_step_six_path
    rails_routes.companies_first_offer_step_six_path(offer_id: source.id)
  end

  def companies_first_offer_step_eight_path
    rails_routes.companies_first_offer_step_eight_path
  end

end