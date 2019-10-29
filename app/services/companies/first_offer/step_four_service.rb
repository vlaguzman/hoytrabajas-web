module Companies::FirstOffer::StepFourService

  def self.call(company: _, update_params: {})
    offer = Offer.find_by(id: update_params[:id])
    update_params.except!(:id)

    persist_offer(offer, update_params)
  end

  def self.persist_offer(offer, update_params)
    create_associations(offer, update_params)

    params = clean_params(update_params)

    updated = offer.update(params)
    if updated
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

  def self.create_associations(offer, update_params)
    offer_age_range = update_params.delete(:offer_age_range).split(",")
    AgeRange.create(offer_id: offer.id, from: offer_age_range[0], to: offer_age_range[1])
  end

  def self.clean_params(update_params)
    sex_ids = update_params[:sex_ids].first.split(",").map(&:to_i)
    update_params
      .inject({}) { |params, (key, value)| params[:sex_ids] = sex_ids; params }
      .reverse_merge!(update_params)
  end

end
