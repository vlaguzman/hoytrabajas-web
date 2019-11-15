import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import { es } from 'date-fns/locale'
import { format } from 'date-fns'
import DataCard from '..'
import EditInfoButton from '../EditInfoButton'

const ProfileDegrees = ({ list, editPath }) => {
  const formatDate = date => format(date, 'MMMM yyyy', { locale: es })

  return (
    <>
      {list && list.length > 0 ? (
        <>
          <Row className="w-100 external">
            {list.map(
              ({
                degree,
                institution_name,
                city_id,
                start_date,
                finish_date,
                ongoing_study
              }) => (
                <Col
                  key={degree + institution_name}
                  xs={12}
                  sm={6}
                  md={4}
                  style={{ marginTop: 30 }}
                >
                  <DataCard
                    haveContent
                    middleDivider
                    headerKind="titleSubNoIconNoChipNoFavCloseEdit"
                    titleSec={degree}
                    subTitleSec={institution_name}
                    smallTitleSec={city_id}
                  >
                    <Typography
                      variant="caption"
                      className="fw-bold text-muted"
                      style={{ textTransform: 'capitalize' }}
                    >
                      {formatDate(start_date)} -{' '}
                      {ongoing_study
                        ? 'Estudio en curso'
                        : formatDate(finish_date)}
                    </Typography>
                  </DataCard>
                </Col>
              )
            )}
          </Row>
          <EditInfoButton
            editPath={editPath}
            text="Editar información"
            hasMarginTop
          />
        </>
      ) : (
        <Row className="w-100 mt-30 justify-content-center">
          <Col
            xs={10}
            className="p-10"
            style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
          >
            <Typography variant="body1" className="text-center d-inline">
              Al parecer no has registrado tus estudios.
              <span className="fw-bold mr-10"> ¡Agrégalos ahora!</span>
              <EditInfoButton editPath={editPath} text="Agregar información" />
            </Typography>
          </Col>
        </Row>
      )}
    </>
  )
}

export default ProfileDegrees