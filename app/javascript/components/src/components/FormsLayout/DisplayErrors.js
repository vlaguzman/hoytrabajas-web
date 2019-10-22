import React from 'react'
import PropTypes from 'prop-types'

const DisplayErrors = ({ errors }) => {
  return (
    <>
      <div>
        {errors.map(error => (
          <span> {error} </span>
        ))}
      </div>
    </>
  )
}

export default DisplayErrors

DisplayErrors.propTypes = {
  errors: PropTypes.object
}