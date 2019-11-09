class Companies::FirstOffer::StepFourPresenter < ApplicationPresenter

  def form_information
    Companies::FirstOffer::StepFour::FormParamsService.new(
      source: source,
      errors: source.errors,
      action_path: companies_first_offer_step_four_path,
      previous_path: companies_first_offer_step_three_path,
      next_path: companies_first_offer_step_eight_path,
      form_type: :offer,
      template_translation_path: "companies.first_offer.step_fours.show",
      form_method: :put
    ).form_params
      .merge({id: source.id})
  end

  private

  def companies_first_offer_step_four_path
    rails_routes.companies_first_offer_step_four_path
  end

  def companies_first_offer_step_three_path
    rails_routes.companies_first_offer_step_three_path(source.id)
  end

  def companies_first_offer_step_eight_path
    rails_routes.companies_first_offer_step_eight_path
  end

end