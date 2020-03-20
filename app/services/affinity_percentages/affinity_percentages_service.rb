module AffinityPercentages::AffinityPercentagesService
  #TODO: When 'to learn skills' has been defined put in offer and curriculum_vitae hashes

  def try_data(object, method)
    object.send(method) if object.present?
  end

  def array_to_string(array)
    array.join(", ") if array.any?
  end

  def curriculum_vitae_for_affinity_percentage(curriculum_vitae)
    {
      available_work_days_curriculum_vitae: array_to_string(curriculum_vitae.available_work_days.pluck(:description)),
      educational_degree_curriculum_vitae:  try_data(curriculum_vitae.user.educational_degree, :description),
      driving_licences_curriculum_vitae:    array_to_string(curriculum_vitae.user.driving_licences.pluck(:description)),
      technical_skills_curriculum_vitae:    array_to_string(curriculum_vitae.technical_skills.map{|ts| try_data(TechnicalSkill.find_by(id: ts.technical_skill_id), :description)}),
      contract_type_id_curriculum_vitae:    try_data(curriculum_vitae.contract_type, :description),
      languages_list_curriculum_vitae:      array_to_string(curriculum_vitae.languages_list.map{|cv_language| try_data(cv_language.language, :description) }),
      job_categories_curriculum_vitae:      array_to_string(curriculum_vitae.job_categories.pluck(:description)),
      working_days_curriculum_vitae:        array_to_string(curriculum_vitae.working_days.pluck(:description)),
      work_mode_id_curriculum_vitae:        array_to_string(curriculum_vitae.work_modes.pluck(:description)),
      soft_skills_curriculum_vitae:         array_to_string(curriculum_vitae.soft_skills.pluck(:description)),
      vehicles_curriculum_vitae:            array_to_string(curriculum_vitae.user.vehicles.pluck(:description)),
      city_id_curriculum_vitae:             try_data(curriculum_vitae.city, :description),
      sexes_curriculum_vitae:               try_data(curriculum_vitae.user.sex, :description)
    }
  end

  def offer_for_affinity_percentage(offer)
    {
      available_work_days_offer: array_to_string(offer.available_work_days.pluck(:description)),
      educational_degree_offer:  try_data(EducationalDegree.find_by(id: offer.educational_degree_id), :description),
      driving_licences_offer:    array_to_string(offer.driving_licences.pluck(:description)),
      technical_skills_offer:    array_to_string(offer.technical_skills.pluck(:description)),
      contract_type_id_offer:    try_data(offer.contract_type, :description),
      languages_list_offer:      array_to_string(offer.languages.pluck(:description)),
      job_categories_offer:      array_to_string(offer.job_categories.pluck(:description)),
      working_days_offer:        array_to_string(offer.working_days.pluck(:description)),
      work_mode_id_offer:        try_data(offer.work_mode, :description),
      soft_skills_offer:         array_to_string(offer.soft_skills.pluck(:description)),
      vehicles_offer:            array_to_string(offer.vehicles.pluck(:description)),
      city_id_offer:             try_data(offer.city, :description),
      sexes_offer:               array_to_string(offer.sexes.pluck(:description))
    }
  end

  def persist_affinity_percentage(affinity_percentage)
    affinity_percentage if affinity_percentage.save
  end

end