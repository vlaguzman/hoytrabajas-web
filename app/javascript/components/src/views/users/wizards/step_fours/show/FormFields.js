import React, { useState, useMemo } from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import SelectChip from '../../../../../components/FormsLayout/Fields/SelectChip'
import Checkbox from '../../../../../components/FormsLayout/Fields/Checkbox'
import {
  handleBoolean,
  handleChange,
  handleDeleteChip,
} from '../../../../../components/FormsLayout/handleFunctions'

const FormFields = props => {
  const { formFields } = props
  const {
    state_id = null,
    travel_disponibility = null,
    city_id = null,
    driving_licence_ids = null,
    vehicle_ids = null
  } = formFields

  const [formValues, setFormValues] = useState({
    [state_id.name]: '',
    [travel_disponibility.name]: false,
    [city_id.name]: '',
    [driving_licence_ids.name]: '',
    [vehicle_ids.name]: ''
  })

  const inputClassname = 'my-30 animated fadeIn'

  const stateIDField = useMemo(
    () => (
      <Col key={state_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[state_id.name]}
          inputName={state_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={state_id.name}
          label={state_id.label}
          selectOptions={state_id.values}
        />
      </Col>
    ),
    [formValues[state_id.name]]
  )

  const travelDisponibilityField = useMemo(
    () => (
      <Col className={inputClassname} xs={12} lg={6}>
        <Checkbox
          inputValue={formValues[travel_disponibility.name]}
          handleBoolean={handleBoolean(formValues, setFormValues)}
          name={travel_disponibility.name}
          label=""
          description={travel_disponibility.label}
          isRequired={false}
        />
      </Col>
    ),
    [formValues[travel_disponibility.name]]
  )

  const cityIDField = useMemo(
    () => (
      <Col key={city_id.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[city_id.name]}
          inputName={city_id.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={city_id.name}
          label={city_id.label}
          selectOptions={city_id.values}
        />
      </Col>
    ),
    [formValues[city_id.name]]
  )

  const vehicleIDsField = useMemo(
    () => (
      <Col key={vehicle_ids.name} className={inputClassname} xs={12} lg={6}>
        <SelectChip
          inputValue={formValues[vehicle_ids.name]}
          inputName={vehicle_ids.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={vehicle_ids.name}
          label={vehicle_ids.label}
          selectOptions={vehicle_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[vehicle_ids.name]]
  )

  const drivingLicenceIDsField = useMemo(
    () => (
      <Col
        key={driving_licence_ids.name}
        className={inputClassname}
        xs={12}
        lg={12}
      >
        <SelectChip
          inputValue={formValues[driving_licence_ids.name]}
          inputName={driving_licence_ids.name}
          handleChange={handleChange(formValues, setFormValues)}
          handleDeleteChip={handleDeleteChip(formValues, setFormValues)}
          name={driving_licence_ids.name}
          label={driving_licence_ids.label}
          selectOptions={driving_licence_ids.values}
          isMultiple
        />
      </Col>
    ),
    [formValues[driving_licence_ids.name]]
  )

  return (
    <Row className="HT__FormGenerator">
      {stateIDField}
      {travelDisponibilityField}
      {cityIDField}
      {vehicleIDsField}
      {drivingLicenceIDsField}
    </Row>
  )
}

export default FormFields

FormFields.propTypes = {
  formFields: PropTypes.shape({
    state_id: PropTypes.object,
    travel_disponibility: PropTypes.object,
    city_id: PropTypes.object,
    driving_licence_ids: PropTypes.object,
    vehicle_ids: PropTypes.object
  }).isRequired
}