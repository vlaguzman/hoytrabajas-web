class Companies::FirstOffer::StepFive::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :from,
    :to
  ]

  SELECT_FIELDS_KEYS = [
    :is_range,
    :currency_id,
    :salary_period_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :working_day_ids,
    :available_work_day_ids,
    :job_aid_ids
  ]

  private

  def from_current_value
    source.salary_from
  end

  def to_current_value
    source.salary_to
  end

  def currency_id_current_value
    source.salary_currency_id
  end

  def salary_period_id_current_value
    source.salary_period_id
  end

  def is_range_current_value
    source.salary_is_range.to_s
  end

  def is_range_list
    options = I18n.t("companies.first_offer.step_fives.show")
    [
      { id: options[:range_value], description: options[:range_description] },
      { id: options[:permanent_value], description: options[:permanent_description] }
    ]
  end

  def currency_id_list
    ListConverter.model_list Currency
  end

  def salary_period_id_list
    ListConverter.model_list SalaryPeriod
  end

  def working_day_ids_list
    ListConverter.model_list WorkingDay
  end

  def available_work_day_ids_list
    ListConverter.model_list AvailableWorkDay
  end

  def job_aid_ids_list
    ListConverter.model_list JobAid
  end
end