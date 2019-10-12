# frozen_string_literal: true
class Companies::RegistrationsController < Devise::RegistrationsController
  protected  

  def after_sign_up_path_for(resource)
    resource.save
    companies_first_offer_step_zero_path
  end

  def after_inactive_sign_up_path_for(resource)
    resource.confirmed_at = DateTime.now
    resource.save
    companies_first_offer_step_zero_path
  end

end
