class OffersController < ApplicationController
  MAX_OFFER_LIMIT = 150

  def index
    query = Offer.active.ransack(params[:q])
    if query.present? && params[:q].present?
      results_query = query.result(distinct: true)
      query_with_filter_categories = OffersService.query_offers_home(results_query, params[:q][:job_category_ids])
      @offers = query_with_filter_categories
        .map{ |offer| Offers::IndexService.new(offer, current_user).details }
    else
      @offers = OffersService.active_offers_index_details(current_user, MAX_OFFER_LIMIT)
    end
  end

  def show
    @offer = offer_show
  end

  private

  def offer_show
    OffersPresenter.new(Offer.find_by(id: params[:id]), current_user)
  end

end
