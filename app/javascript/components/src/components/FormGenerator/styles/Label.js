import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import styled from 'styled-components'

const StyledLabel = styled(Typography)`
  color: ${props => props.theme.palette.secondary.main};
  font-size: 16px;
`

const Label = ({ children, ...props }) => {
  return (
    <StyledLabel className="MuiInputLabel-shrink" {...props}>
      {children}
    </StyledLabel>
  )
}

export default Label

Label.propTypes = {
  children: PropTypes.string.isRequired
}