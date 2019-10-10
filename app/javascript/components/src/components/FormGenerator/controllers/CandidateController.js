import React, { useState, useEffect, useContext } from 'react'
import { Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DefaultContainer from '../containers/DefaultContainer'
import UncontrolledContainer from '../containers/UncontrolledContainer'
import MultiFormContainer from '../containers/MultiFormContainer'

const Title = ({ name, className, title, ...props }) => (
  <Typography
    variant="body1"
    className="position-absolute text-wrap animated fadeIn"
    style={{
      top: '-10px',
      left: '10px',
      marginTop: '20px',
      position: 'relative'
    }}
  >
    {title}
  </Typography>
)

const CandidateController = ({
  formObj,
  formSection,
  formName,
  scrollAction
}) => {
  const sectionsWithMultipleForms = ['experiences', 'education', 'diplomas']
  const hasMultipleForms = sectionsWithMultipleForms.includes(formSection)

  return formObj.map(item => {
    const {
      kind,
      pro,
      className,
      title,
      aux,
      extra,
      ownSection = null,
      ...props
    } = item
    const { name } = pro
    if (hasMultipleForms) {
      return (
        <>
          {title && <Title {...props} {...{ name, className, title }} />}
          <MultiFormContainer
            key={name}
            {...{
              formName,
              formSection: ownSection || formSection,
              kind,
              pro,
              extra
            }}
          />
        </>
      )
    }

    if (formSection === 'skills') {
      return (
        <Col key={name} className={className} {...props}>
          {title && <Title {...props} {...{ name, className, title }} />}
          <UncontrolledContainer
            {...{
              formSection: ownSection || formSection,
              formName,
              item,
              name
            }}
          />
        </Col>
      )
    }

    return (
      <Col key={name} className={className} {...props}>
        {title && <Title {...props} {...{ name, className, title }} />}
        <DefaultContainer
          {...{
            formSection: ownSection || formSection,
            formName,
            scrollAction,
            item,
            name
          }}
        />
      </Col>
    )
  })
}

export default CandidateController
