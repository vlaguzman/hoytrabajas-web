class Users::Wizards::StepSix::FormParamsService < BaseFormWizardsService

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :soft_skill_ids
  ]

  SUBFORMS = [:technical_skills, :to_learn_skills, :languages]

  SUBFORMS_FIELDS = {
    :technical_skills => [:job_category_id, :technical_skill_id, :level_id],
    :to_learn_skills => [:job_category_id, :technical_skill_id],
    :languages => [:language_id, :level_id]
  }

  private

  def fields_builder
    super(
      subform_object_builder(:technical_skills),
      subform_object_builder(:to_learn_skills),
      subform_object_builder(:languages)
    )
  end

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
