class AffinityPercentages::UpdateAffinityPercentagesService
  include AffinityPercentages::AffinityPercentagesService

  def update_affinity(affinity, action)
    options_data = {
      :offer_updated       => -> { offer_for_affinity_percentage(affinity.offer) },
      :cv_and_user_updated => -> { curriculum_vitae_for_affinity_percentage(affinity.curriculum_vitae) }
    }

    affinity_percentage_data = options_data[action].()

    affinity.update(affinity_percentage_data)
    persist_affinity_percentage(affinity)
  end

end