import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../src/components/FormsLayout/Fields/SelectChip'
import StandardInput from '../../../../../src/components/FormsLayout/Fields/StandardInput'
import DatePicker from '../../../../../src/components/FormsLayout/Fields/DatePicker'
import Checkbox from '../../../../../src/components/FormsLayout/Fields/Checkbox'
import SelectFindOrCreate from '../../../../../src/components/FormsLayout/Fields/SelectFindOrCreate'

import {
  handleDeleteChip,
  handleChange,
  handleSimpleChange,
  handleBoolean
} from '../../../../../src/components/FormsLayout/handleFunctions'
import LocationPicker from '../../../../../src/components/FormsLayout/LocationPicker'

const inputClassname = 'my-30 animated fadeIn inputField'

const dateOptions = {
  format: 'dd/MM/yyyy',
  disableFuture: false,
  emptyLabel: '...'
}

const FormFields = props => {
  const { formFields, tooltip_description } = props
  const {
    job_category_id = null,
    company_name = null,
    work_position = null,
    work_methodology_id = null,
    country_id = null,
    city_id = null,
    state_id = null,
    finished_at = null,
    started_at = null,
    technical_skills = null,
    still_in_progress = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [job_category_id.name]: job_category_id.current_value || '',
    [company_name.name]: company_name.current_value || '',
    [work_position.name]: work_position.current_value || '',
    [work_methodology_id.name]: work_methodology_id.current_value || '',
    [country_id.name]: country_id.current_value || '',
    [city_id.name]: city_id.current_value || '',
    [state_id.name]: state_id.current_value || '',
    [technical_skills.name]: technical_skills.current_value || '',
    [started_at.name]: started_at.current_value || new Date(),
    [finished_at.name]: finished_at.current_value || new Date(),
    [still_in_progress.name]: still_in_progress.current_value || false
  })

  const {
    CountrySelect,
    StateSelect,
    CitySelect,
    numberOfColumsToLocationPicker
  } = LocationPicker({
    countriesProperties: country_id,
    statesProperties: state_id,
    citiesProperties: city_id
  })

  const jobCategoryIDField = useMemo(
    () => (
      <Col key={job_category_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[job_category_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={job_category_id.name}
          label={job_category_id.label}
          selectOptions={job_category_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[job_category_id.name]]
  )

  const companyNameField = useMemo(
    () => (
      <Col key={company_name.name} className={inputClassname} xs={12} lg={6}>
        <StandardInput
          inputValue={formValues[company_name.name]}
          handleChange={handleChange(formValues, setFormValues)}
          name={company_name.name}
          label={company_name.label}
        />
      </Col>
    ),
    [formValues[company_name.name]]
  )

  const workPositionField = useMemo(
    () => (
      <Col key={work_position.name} className={inputClassname} xs={12} lg={6}>
        <SelectFindOrCreate
          id={work_position.name}
          label={work_position.label}
          name={work_position.name}
          input_value={work_position.current_value}
          options={work_position.values}
          tooltip_description={tooltip_description['press_enter']}
        />
      </Col>
    ),
    []
  )

  const workMethodologyIDField = useMemo(
    () => (
      <Col
        key={work_methodology_id.name}
        className={inputClassname}
        xs={12}
        lg={6}
      >
        <SelectChip
          inputValue={formValues[work_methodology_id.name]}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={work_methodology_id.name}
          label={work_methodology_id.label}
          selectOptions={work_methodology_id.values}
          isMultiple={false}
        />
      </Col>
    ),
    [formValues[work_methodology_id.name]]
  )

  const CountryIDsField = () => {
    return (
      CountrySelect && (
        <Col
          key={country_id.name}
          className={inputClassname}
          xs={12}
          lg={numberOfColumsToLocationPicker}
        >
          {CountrySelect}
        </Col>
      )
    )
  }

  const stateIDField = () => {
    return (
      StateSelect && (
        <Col
          key={state_id.name}
          className={inputClassname}
          xs={12}
          lg={numberOfColumsToLocationPicker}
        >
          {StateSelect}
        </Col>
      )
    )
  }

  const cityIDField = () => {
    return (
      CitySelect && (
        <Col
          key={city_id.name}
          className={inputClassname}
          xs={12}
          lg={numberOfColumsToLocationPicker}
        >
          {CitySelect}
        </Col>
      )
    )
  }

  const technicalSkillsField = useMemo(
    () => (
      <Col
        key={technical_skills.name}
        className={inputClassname}
        xs={12}
        lg={12}
      >
        <SelectFindOrCreate
          label={technical_skills.label}
          name={technical_skills.name}
          id={technical_skills.name}
          input_value={technical_skills.current_value}
          options={technical_skills.values}
          tooltip_description={tooltip_description['use_coma']}
          isMultiple
        />
      </Col>
    ),
    []
  )

  const startedAtField = useMemo(
    () => (
      <Col
        key={started_at.name}
        className={inputClassname}
        xs={12}
        lg={formValues[still_in_progress.name] ? 6 : 3}
      >
        <DatePicker
          name={started_at.name}
          inputValue={formValues[started_at.name]}
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={started_at.label}
          dateOptions={dateOptions}
        />
      </Col>
    ),
    [formValues[started_at.name], formValues[still_in_progress.name]]
  )

  const finishedAtField = useMemo(
    () => (
      <Col key={finished_at.name} className={inputClassname} xs={12} lg={3}>
        <DatePicker
          name={finished_at.name}
          inputValue={
            formValues[still_in_progress.name]
              ? null
              : formValues[finished_at.name]
          }
          handleSimpleChange={handleSimpleChange(formValues, setFormValues)}
          label={finished_at.label}
          dateOptions={dateOptions}
          minDate={formValues[started_at.name] || null}
          minDateMessage="La fecha de finalización debe ser posterior a la de inicio." // TODO: replace with translation string
        />
      </Col>
    ),
    [formValues[started_at.name], formValues[finished_at.name]]
  )

  const inProgressField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Checkbox
          inputValue={formValues[still_in_progress.name]}
          handleBoolean={handleBoolean(setFormValues)}
          name={still_in_progress.name}
          label=""
          description={still_in_progress.label}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[still_in_progress.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {jobCategoryIDField}
      {companyNameField}
      {workPositionField}
      {workMethodologyIDField}
      {CountryIDsField()}
      {stateIDField()}
      {cityIDField()}
      {technicalSkillsField}
      {startedAtField}
      {!formValues[still_in_progress.name] && finishedAtField}
      {inProgressField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    job_category_id: PropTypes.object,
    company_name: PropTypes.object,
    work_position: PropTypes.object,
    work_methodology_id: PropTypes.object,
    country_id: PropTypes.object,
    city_id: PropTypes.object,
    state_id: PropTypes.object,
    technical_skills: PropTypes.object,
    finished_at: PropTypes.object,
    started_at: PropTypes.object,
    technical_skill_ids: PropTypes.object,
    still_in_progress: PropTypes.object
  }).isRequired
}