import React, { useContext, Fragment } from 'react'
import Button from '@material-ui/core/Button'
import { Row } from 'reactstrap'

const FormButtons = props => {
  const { scrollAction, next, prev, formSection } = props
  const isChoiceForm = formSection.toLowerCase() === 'has_experience'

  const nextPage = () => {
    if (next) {
      location.assign(`/companies/first_offer/${next}`)
    } else {
      location.assign(`/companies/first_offer/completed`)
    }
  }

  const prevPage = () => {
    location.assign(`/companies/first_offer/${prev}`)
  }

  const submit = e => {
    e.preventDefault()
    nextPage()
  }
  return (
    <Fragment>
    <div className="w-100 my-70" style={{ height: '15%' }}>
      <div className="w-100 d-flex justify-content-center">
        {!isChoiceForm && (
          <Button
            type="submit"
            onClick={submit}
            variant={next ? 'outlined' : 'contained'}
            size="large"
            color="primary"
            style={{ borderRadius: '30px' }}
            className={`text-wrap text-${
              next ? 'primary' : 'white'
            } fw-bold mt-10 col-6 col-md-4`}
          >
            {next ? 'siguiente' : 'publicar'}
          </Button>
        )}
      </div>
    </div>
      <div className="w-100 d-flex justify-content-between">
        {prev !== null && (
          <Button
            onClick={prevPage}
            size="small"
            style={{bottom: '0', left: '0'}}
            className="position-absolute text-wrap text-muted fw-bold mt-0 mx-5 w-20 animated fadeIn"
          >
            <i className="ti-arrow-circle-left mx-10" />
            <small className="fw-bold text-muted">REGRESAR</small>
          </Button>
        )}
        {prev !== null && next && next !== 'step_two' && !isChoiceForm && (
          <Button
            onClick={nextPage}
            size="small"
            style={{bottom: '0', right: '0'}}
            className="position-absolute text-wrap text-muted fw-bold mx-5 mt-0 w-20 animated fadeIn"
          >
            <small className="fw-bold text-muted mx-10">SALTAR</small>
            <i className="ti-arrow-circle-right" />
          </Button>
        )}
      </div>
    </Fragment>
  )
}

export default FormButtons
