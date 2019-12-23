module Users::Wizards::StepEightService
  def self.call(source: _, update_params: {})
    update_params.tap do |field|
      field[:technical_skills] = persist_technical_skills(source, field[:technical_skills])
    end

    persist_work_experience(source, params: update_params)
  end

  private

  def self.persist_work_experience(work_experience, params: {})
    [ work_experience, work_experience.update(params) ]
  end

  def self.persist_technical_skills(work_experience, technical_skills)
    work_experience.technical_skills.destroy_all

    technical_skills
      .split(',')
      .map(&:strip)
      .map { |technicall_skill| find_or_create_skill({description: technicall_skill}) }
  end

  def self.find_or_create_skill(params)
    BaseForms::FindOrCreateRecordService.(klass: TechnicalSkill, search_or_cration_params: params )
  end

end