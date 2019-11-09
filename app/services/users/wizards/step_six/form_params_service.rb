class Users::Wizards::StepSix::FormParamsService < BaseFormWizardsService

  SELECT_FIELDS_KEYS = [
    :job_category_id,
    :technical_skill_id,
    :level_id,
    :language_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :soft_skill_ids
  ]

  def select_fields_builder
    super('curriculum_vitae')
  end

  def multiple_select_fields_builder
    super('curriculum_vitae')
  end

  private

  def soft_skill_ids_list
    ListConverter.model_list SoftSkill
  end

  def job_category_id_list
    ListConverter.model_list JobCategory
  end

  def technical_skill_id_list
    ListConverter.model_list TechnicalSkill
  end

  def level_id_list
    ListConverter.model_list Level
  end

  def language_id_list
    ListConverter.model_list Language
  end

end