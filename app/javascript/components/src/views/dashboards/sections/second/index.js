import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
// import Button from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import Card from '@material-ui/core/Card'
import CardHeader from '@material-ui/core/CardHeader'
import CardContent from '@material-ui/core/CardContent'
// import CardActions from '@material-ui/core/CardActions'
// import Divider from '@material-ui/core/Divider'
import Table from '@material-ui/core/Table'
import TableBody from '@material-ui/core/TableBody'
import TableCell from '@material-ui/core/TableCell'
import TableHead from '@material-ui/core/TableHead'
import TableRow from '@material-ui/core/TableRow'
import Chip from '@material-ui/core/Chip'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
// import CheckCircle from '@material-ui/icons/CheckCircle'
import RemoveCircleOutline from '@material-ui/icons/RemoveCircleOutline'
// import ChatBubbleOutline from '@material-ui/icons/ChatBubbleOutline'

/* const rows = [
  {
    oferta: 'Community manager proactivo',
    timer: '20:00',
    aplicaiones: '10',
    inicio: '5/5/2019',
    cierre: '20/5/2019',
    estado: true
  }
] */

const Second = ({ applied_offers, second_section }) => {
  applied_offers = applied_offers || []

  const {
    you_have_applied_to,
    my_applys,
    offers_count,
    one_offer
  } = second_section

  const theTitle = text => (
    <>
      <IconButton className="p-0" aria-label="Settings">
        <FavoriteBorder />
      </IconButton>
      <Typography
        className="mb-10 ml-10 fw-bold d-lg-none"
        component="span"
        variant="h6"
      >
        {text}
      </Typography>
    </>
  )
  return (
    <Row noGutters className="w-100 justify-content-between my-30 p-10">
      <Col xs={12} className="bg-primary">
        <Card className="p-25">
          <CardHeader
            action={
              <Chip
                className="text-white mt-20 mr-20 d-none d-lg-block"
                label={
                  <Typography variant="body1" className="m-5">
                    {you_have_applied_to}
                    <span className="fw-bold">
                      {applied_offers.length} {offers_count}
                    </span>
                  </Typography>
                }
                clickable
                color="primary"
              />
            }
            title={theTitle(my_applys)}
            subheader={
              <Typography
                className="mb-10 fw-bold d-none d-lg-inline"
                variant="h5"
              >
                {my_applys}
              </Typography>
            }
          />
          <CardContent className="px-0-dash">
            <Row noGutters className="justify-content-center d-lg-none ">
              <Chip
                className="text-white py-1"
                label={
                  <Typography variant="caption" className="text-center">
                    {you_have_applied_to}
                    <span className="fw-bold">
                      {applied_offers.length} {offers_count}
                    </span>
                  </Typography>
                }
                clickable
                color="primary"
              />
            </Row>
            <div className="container">
              <Table style={{ minWidth: '650' }}>
                <TableHead className="bg-white">
                  <TableRow>
                    <TableCell
                      className="text-info"
                      align="left"
                      padding="checkbox"
                    />
                    <TableCell
                      className="text-info"
                      align="center"
                      size="medium"
                    >
                      {one_offer}
                    </TableCell>
                    {/* <TableCell className="text-info" align="left">
                    Chat
                  </TableCell> */}
                    {/* <TableCell className="text-info" align="left">
                    <i className="ti-timer"></i>
                  </TableCell> */}
                    {/* <TableCell className="text-info" align="left">
                    Aplicaciones
                  </TableCell> */}
                    {/* <TableCell className="text-info" align="left">
                    Inicio
                  </TableCell> */}
                    {/* <TableCell className="text-info" align="left">
                    Cierre
                  </TableCell> */}
                    {/* <TableCell className="text-info" align="left">
                    Estado
                  </TableCell> */}
                  </TableRow>
                </TableHead>
                <TableBody>
                  {applied_offers &&
                    applied_offers.map(offer => (
                      <TableRow key={offer.title}>
                        <TableCell align="left" padding="checkbox">
                          <RemoveCircleOutline />
                        </TableCell>
                        <TableCell align="center" size="medium">
                          {offer.title}
                        </TableCell>
                        {/* <TableCell component="th" scope="row">
                      <ChatBubbleOutline />
                    </TableCell> */}
                        {/* <TableCell align="left">{row.timer}</TableCell> */}
                        {/* <TableCell align="left">{row.aplicaiones}</TableCell> */}
                        {/* <TableCell align="left">{row.inicio}</TableCell> */}
                        {/* <TableCell align="left">{row.cierre}</TableCell> */}
                        {/* <TableCell align="left">
                      {row.estado ? 'Abierto' : 'Cerrado'}
                    </TableCell> */}
                      </TableRow>
                    ))}
                </TableBody>
              </Table>
            </div>
          </CardContent>
        </Card>
      </Col>
    </Row>
  )
}

Second.propTypes = {
  applied_offers: PropTypes.array,
  second_section: PropTypes.shape({
    you_have_applied_to: PropTypes.string,
    my_applys: PropTypes.string,
    offers_count: PropTypes.string,
    one_offer: PropTypes.string
  })
}

export default Second
